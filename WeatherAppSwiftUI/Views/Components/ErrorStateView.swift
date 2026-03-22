import SwiftUI

struct ErrorStateView: View {
    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> Void

    var body: some View {
        VStack(spacing: 18) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 46))
                .foregroundStyle(Color.orange)

            Text(title)
                .font(.title2.weight(.semibold))
                .foregroundStyle(AppTheme.primaryText)

            Text(message)
                .font(.body)
                .foregroundStyle(AppTheme.secondaryText)
                .multilineTextAlignment(.center)

            Button(action: action) {
                Text(buttonTitle)
                    .font(.headline)
                    .foregroundStyle(Color(red: 0.12, green: 0.20, blue: 0.35))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(AppTheme.accent, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            }
        }
        .padding(28)
        .weatherCardBackground(cornerRadius: 28)
        .padding(.horizontal, 24)
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        ErrorStateView(
            title: "Weather request failed",
            message: "The latest weather data could not be loaded.",
            buttonTitle: "Retry",
            action: {}
        )
    }
}
