import SwiftUI

struct WeatherSummaryCard: View {
    let weather: WeatherSnapshot

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {

            Text("Overview")
                .font(.caption.weight(.semibold))
                .foregroundStyle(AppTheme.secondaryText.opacity(0.7))

            Text(weather.overviewText)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(AppTheme.primaryText)
                .fixedSize(horizontal: false, vertical: true)

            Divider()
                .overlay(.white.opacity(0.12))

            HStack {
                Text("Updated")
                Spacer()
                Text(weather.lastUpdatedText)
            }
            .font(.caption)
            .foregroundStyle(AppTheme.secondaryText.opacity(0.7))
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [
                    .white.opacity(0.12),
                    .white.opacity(0.05)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            in: RoundedRectangle(cornerRadius: 24)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(.white.opacity(0.12))
        )
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        WeatherSummaryCard(weather: .preview)
            .padding(24)
    }
}
