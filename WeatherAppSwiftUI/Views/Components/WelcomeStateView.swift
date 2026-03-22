import CoreLocationUI
import SwiftUI

struct WelcomeStateView: View {
    let onRequestLocation: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Spacer()

            VStack(alignment: .leading, spacing: 18) {
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.system(size: 54))
                    .foregroundStyle(AppTheme.accent)

                Text("Accurate Weather,\nInstantly")
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .foregroundStyle(AppTheme.primaryText)
            }

            VStack(alignment: .leading, spacing: 14) {
                LocationButton(.currentLocation) {
                    onRequestLocation()
                }
                .labelStyle(.titleAndIcon)
                .symbolVariant(.fill)
                .tint(Color(red: 0.12, green: 0.20, blue: 0.35))
                .cornerRadius(18)
                .frame(height: 56)

                Text("Your location is used only to fetch the current forecast for this session.")
                    .font(.footnote)
                    .foregroundStyle(AppTheme.secondaryText)
            }

            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 32)
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        WelcomeStateView(onRequestLocation: {})
    }
}
