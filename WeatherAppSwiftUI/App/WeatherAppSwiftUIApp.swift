import SwiftUI

@main
struct WeatherAppSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: WeatherViewModel(
                    weatherService: OpenWeatherService(),
                    locationService: DefaultLocationService()
                )
            )
        }
    }
}
