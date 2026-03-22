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

                HStack(spacing: 14) {
                    temperatureChip(title: "Low", value: weather.minTemperature.temperatureText)
                    temperatureChip(title: "High", value: weather.maxTemperature.temperatureText)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image("house")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .shadow(color: AppTheme.shadowColor, radius: 18, x: 0, y: 12)
                .offset(x: 12, y: 18)
        }
        .padding(24)
        .weatherCardBackground(cornerRadius: 32)
    }

    private func temperatureChip(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title.uppercased())
                .font(.caption.weight(.semibold))
                .foregroundStyle(AppTheme.secondaryText)

            Text(value)
                .font(.headline.weight(.semibold))
                .foregroundStyle(AppTheme.primaryText)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(.white.opacity(0.08), in: Capsule())
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        WeatherHeroCard(weather: .preview)
            .padding(24)
    }
}
