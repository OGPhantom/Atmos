import SwiftUI

struct WeatherHeroCard: View {
    let weather: WeatherSnapshot

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(weather.cityName)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundStyle(AppTheme.primaryText)

                    Label(weather.conditionDescription, systemImage: weather.systemImageName)
                        .font(.headline)
                        .foregroundStyle(AppTheme.secondaryText)
                }

                Text(weather.temperature.temperatureText)
                    .font(.system(size: 90, weight: .bold, design: .rounded))
                    .foregroundStyle(AppTheme.primaryText)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)


                VStack(spacing: 10) {
                    HStack {
                        temperatureEdge(title: "Low", value: weather.minTemperature.temperatureText)

                        Spacer()

                        temperatureEdge(title: "High", value: weather.maxTemperature.temperatureText)
                    }

                    Capsule()
                        .fill(
                            LinearGradient(
                                colors: [
                                    .blue.opacity(0.8),
                                    .cyan.opacity(0.8),
                                    .yellow.opacity(0.8)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(height: 6)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(24)
        .weatherCardBackground(cornerRadius: 32)
    }

    private func temperatureEdge(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title.uppercased())
                .font(.caption2.weight(.semibold))
                .foregroundStyle(AppTheme.secondaryText.opacity(0.8))

            Text(value)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(AppTheme.primaryText)
        }
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        WeatherHeroCard(weather: .preview)
            .padding(24)
    }
}
