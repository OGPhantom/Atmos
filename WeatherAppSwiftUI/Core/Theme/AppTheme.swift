import SwiftUI

enum AppTheme {
    static let backgroundGradient = LinearGradient(
        colors: [
            Color(red: 0.09, green: 0.15, blue: 0.30),
            Color(red: 0.11, green: 0.30, blue: 0.53),
            Color(red: 0.28, green: 0.60, blue: 0.86)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let accent = Color(red: 1.0, green: 0.82, blue: 0.42)
    static let primaryText = Color.white
    static let secondaryText = Color.white.opacity(0.74)
    static let shadowColor = Color.black.opacity(0.22)
}
