import Foundation

@MainActor
final class WeatherViewModel: ObservableObject {
    enum State {
        case idle
        case loading(message: String)
        case loaded(WeatherSnapshot)
        case failed(ScreenError)
    }

    struct ScreenError {
        let title: String
        let message: String
        let buttonTitle: String
    }

    @Published private(set) var state: State = .idle

    private let weatherService: WeatherService
    private let locationService: LocationService

    init(weatherService: WeatherService, locationService: LocationService) {
        self.weatherService = weatherService
        self.locationService = locationService
    }

    func requestWeather() async {
        guard !isLoading else { return }

        do {
            state = .loading(message: "Requesting your location")
            let location = try await locationService.requestCurrentLocation()

            state = .loading(message: "Fetching the latest conditions")
            let weather = try await weatherService.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )

            state = .loaded(weather)
        } catch let error as LocationServiceError {
            state = .failed(Self.mapLocationError(error))
        } catch let error as WeatherServiceError {
            state = .failed(Self.mapWeatherError(error))
        } catch {
            state = .failed(
                ScreenError(
                    title: "Something went wrong",
                    message: error.localizedDescription,
                    buttonTitle: "Try Again"
                )
            )
        }
    }

    var isLoading: Bool {
        if case .loading = state {
            return true
        }

        return false
    }

    private static func mapLocationError(_ error: LocationServiceError) -> ScreenError {
        switch error {
        case .accessDenied:
            return ScreenError(
                title: "Location access is required",
                message: "Allow location access so the app can fetch live weather for your current position.",
                buttonTitle: "Try Again"
            )
        case .servicesDisabled:
            return ScreenError(
                title: "Location Services are off",
                message: "Enable Location Services on the device and try again.",
                buttonTitle: "Try Again"
            )
        default:
            return ScreenError(
                title: "Location unavailable",
                message: error.errorDescription ?? "The current location could not be determined.",
                buttonTitle: "Try Again"
            )
        }
    }

    private static func mapWeatherError(_ error: WeatherServiceError) -> ScreenError {
        switch error {
        case .missingAPIKey:
            return ScreenError(
                title: "Missing API key",
                message: "Create a local Secrets.xcconfig with your OpenWeather API key before running the app.",
                buttonTitle: "Try Again"
            )
        default:
            return ScreenError(
                title: "Weather request failed",
                message: error.errorDescription ?? "The latest weather data could not be loaded.",
                buttonTitle: "Retry"
            )
        }
    }
}
