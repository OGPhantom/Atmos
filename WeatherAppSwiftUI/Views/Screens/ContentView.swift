import CoreLocation
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: WeatherViewModel

    init(viewModel: WeatherViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            WeatherBackgroundView()

            switch viewModel.state {
            case .idle:
                WelcomeStateView {
                    Task {
                        await viewModel.requestWeather()
                    }
                }
            case .loading(let message):
                LoadingStateView(message: message)
            case .loaded(let weather):
                WeatherDashboardView(weather: weather) {
                    await viewModel.requestWeather()
                }
            case .failed(let error):
                ErrorStateView(
                    title: error.title,
                    message: error.message,
                    buttonTitle: error.buttonTitle
                ) {
                    Task {
                        await viewModel.requestWeather()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview("Idle") {
    ContentView(
        viewModel: WeatherViewModel(
            weatherService: PreviewWeatherService(),
            locationService: PreviewLocationService()
        )
    )
}

private struct PreviewWeatherService: WeatherService {
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherSnapshot {
        .preview
    }
}

private final class PreviewLocationService: LocationService {
    @MainActor
    func requestCurrentLocation() async throws -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 50.4501, longitude: 30.5234)
    }
}
