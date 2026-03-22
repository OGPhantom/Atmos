import CoreLocation

protocol LocationService: AnyObject {
    @MainActor
    func requestCurrentLocation() async throws -> CLLocationCoordinate2D
}

enum LocationServiceError: LocalizedError {
    case servicesDisabled
    case accessDenied
    case locationRequestInProgress
    case unableToDetermineLocation
    case locationRequestFailed(String)

    var errorDescription: String? {
        switch self {
        case .servicesDisabled:
            return "Location Services are disabled on this device."
        case .accessDenied:
            return "Location access is not allowed. Enable it in Settings to fetch live weather."
        case .locationRequestInProgress:
            return "A location request is already in progress."
        case .unableToDetermineLocation:
            return "The app could not determine your current position."
        case .locationRequestFailed(let message):
            return message
        }
    }
}
