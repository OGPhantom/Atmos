import CoreLocation
import Foundation

final class DefaultLocationService: NSObject, LocationService, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private var authorizationContinuation: CheckedContinuation<Void, Error>?
    private var locationContinuation: CheckedContinuation<CLLocationCoordinate2D, Error>?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }

    @MainActor
    func requestCurrentLocation() async throws -> CLLocationCoordinate2D {
        guard CLLocationManager.locationServicesEnabled() else {
            throw LocationServiceError.servicesDisabled
        }

        try await requestAuthorizationIfNeeded()

        return try await withCheckedThrowingContinuation { continuation in
            guard locationContinuation == nil else {
                continuation.resume(throwing: LocationServiceError.locationRequestInProgress)
                return
            }

            locationContinuation = continuation
            manager.requestLocation()
        }
    }

    @MainActor
    private func requestAuthorizationIfNeeded() async throws {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            return
        case .denied, .restricted:
            throw LocationServiceError.accessDenied
        case .notDetermined:
            try await withCheckedThrowingContinuation { continuation in
                authorizationContinuation = continuation
                manager.requestWhenInUseAuthorization()
            }
        @unknown default:
            throw LocationServiceError.unableToDetermineLocation
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let authorizationContinuation else { return }

        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            self.authorizationContinuation = nil
            authorizationContinuation.resume(returning: ())
        case .denied, .restricted:
            self.authorizationContinuation = nil
            authorizationContinuation.resume(throwing: LocationServiceError.accessDenied)
        case .notDetermined:
            break
        @unknown default:
            self.authorizationContinuation = nil
            authorizationContinuation.resume(throwing: LocationServiceError.unableToDetermineLocation)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else {
            locationContinuation?.resume(throwing: LocationServiceError.unableToDetermineLocation)
            locationContinuation = nil
            return
        }

        locationContinuation?.resume(returning: coordinate)
        locationContinuation = nil
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationContinuation?.resume(throwing: LocationServiceError.locationRequestFailed(error.localizedDescription))
        locationContinuation = nil
    }
}
