import SwiftUI

struct WeatherMetricCard: View {
    let title: String
    let value: String
    let systemImage: String
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Image(systemName: systemImage)
                .font(.title2.weight(.semibold))
                .foregroundStyle(tint)
                .frame(width: 42, height: 42)
                .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 14, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(AppTheme.secondaryText)

                Text(value)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundStyle(AppTheme.primaryText)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .weatherCardBackground(cornerRadius: 24)
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        WeatherMetricCard(title: "Humidity", value: "88%", systemImage: "humidity.fill", tint: .cyan)
            .padding(24)
    }
}
