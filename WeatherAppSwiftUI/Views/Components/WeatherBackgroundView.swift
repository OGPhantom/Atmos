import SwiftUI

struct WeatherBackgroundView: View {
    var body: some View {
        ZStack {
            AppTheme.backgroundGradient

            Circle()
                .fill(Color.white.opacity(0.12))
                .frame(width: 280, height: 280)
                .blur(radius: 30)
                .offset(x: 140, y: -230)

            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 220, height: 220)
                .blur(radius: 40)
                .offset(x: -160, y: -40)

            Circle()
                .fill(AppTheme.accent.opacity(0.18))
                .frame(width: 260, height: 260)
                .blur(radius: 55)
                .offset(x: -120, y: 320)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WeatherBackgroundView()
}
