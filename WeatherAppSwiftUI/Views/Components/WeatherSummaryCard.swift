import SwiftUI

struct WeatherSummaryCard: View {
    let weather: WeatherSnapshot

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Overview")
                .font(.headline.weight(.semibold))
                .foregroundStyle(AppTheme.primaryText)

            Text(weather.overviewText)
                .font(.body)
                .foregroundStyle(AppTheme.secondaryText)
                .fixedSize(horizontal: false, vertical: true)

            Divider()
                .overlay(.white.opacity(0.12))

            HStack {
                Text("Last updated")
                    .foregroundStyle(AppTheme.secondaryText)

                Spacer()

                Text(weather.lastUpdatedText)
                    .foregroundStyle(AppTheme.primaryText)
            }
            .font(.subheadline.weight(.medium))
        }
        .padding(20)
        .weatherCardBackground(cornerRadius: 24)
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        WeatherSummaryCard(weather: .preview)
            .padding(24)
    }
}
