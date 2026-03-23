import CoreLocationUI
import SwiftUI

struct WelcomeStateView: View {
    let onRequestLocation: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            Spacer()

            HStack(alignment: .center, spacing: 18) {
                Image(systemName: "cloud.sun.rain.fill")
                    .font(.system(size: 54))
                    .foregroundStyle(AppTheme.accent)

                Text("Accurate Weather,\nInstantly")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(AppTheme.primaryText)
            }

            VStack(alignment: .leading, spacing: 14) {
                Button {
                    onRequestLocation()
                } label: {
                    HStack {
                        Image(systemName: "location.fill")
                        Text("Current Location")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                }
                .background(Color(red: 0.12, green: 0.20, blue: 0.35))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))

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
