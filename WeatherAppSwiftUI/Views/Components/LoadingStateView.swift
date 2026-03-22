import SwiftUI

struct LoadingStateView: View {
    let message: String

    @State private var animateIcon = false

    var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(.white.opacity(0.12))
                    .frame(width: 132, height: 132)
                    .scaleEffect(animateIcon ? 1.06 : 0.94)

                Image(systemName: "cloud.sun.fill")
                    .font(.system(size: 54))
                    .foregroundStyle(AppTheme.accent)
                    .rotationEffect(.degrees(animateIcon ? 4 : -4))
            }

            VStack(spacing: 10) {
                Text("Loading weather")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(AppTheme.primaryText)

                Text(message)
                    .font(.body)
                    .foregroundStyle(AppTheme.secondaryText)
                    .multilineTextAlignment(.center)
            }

            ProgressView()
                .tint(.white)
                .scaleEffect(1.15)
        }
        .padding(32)
        .weatherCardBackground(cornerRadius: 32)
        .padding(.horizontal, 24)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.8).repeatForever(autoreverses: true)) {
                animateIcon = true
            }
        }
    }
}

#Preview {
    ZStack {
        WeatherBackgroundView()
        LoadingStateView(message: "Fetching the latest conditions")
    }
}
