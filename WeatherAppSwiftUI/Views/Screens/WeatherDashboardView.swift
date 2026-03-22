import SwiftUI

struct WeatherDashboardView: View {
    let weather: WeatherSnapshot
    let onRefresh: () async -> Void

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                header
                WeatherHeroCard(weather: weather)

                LazyVGrid(columns: columns, spacing: 16) {
                    WeatherMetricCard(
                        title: "Feels Like",
                        value: weather.feelsLike.temperatureText,
                        systemImage: "thermometer.medium",
                        tint: .orange
                    )
                    WeatherMetricCard(
                        title: "Wind",
                        value: weather.windSpeed.windSpeedText,
                        systemImage: "wind",
                        tint: .mint
                    )
                    WeatherMetricCard(
                        title: "Humidity",
                        value: weather.humidity.percentageText,
                        systemImage: "humidity.fill",
                        tint: .cyan
                    )
                    WeatherMetricCard(
                        title: "Pressure",
                        value: weather.pressure.pressureText,
                        systemImage: "gauge.with.dots.needle.33percent",
                        tint: .yellow
                    )
                }

                WeatherSummaryCard(weather: weather)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 32)
        }
        .refreshable {
            await onRefresh()
        }
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Hello, Nikita!")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundStyle(AppTheme.secondaryText)

                Text("Current Conditions")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(AppTheme.primaryText)
            }

            Spacer()

            Button {
                Task {
                    await onRefresh()
                }
            } label: {
                Image(systemName: "arrow.clockwise")
                    .font(.headline.weight(.bold))
                    .foregroundStyle(Color(red: 0.12, green: 0.20, blue: 0.35))
                    .frame(width: 46, height: 46)
                    .background(AppTheme.accent, in: Circle())
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        WeatherDashboardView(weather: .preview, onRefresh: {})
    }
}
