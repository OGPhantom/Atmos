import SwiftUI

extension View {
    func weatherCardBackground(cornerRadius: CGFloat = 28) -> some View {
        background(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(.white.opacity(0.12))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(.white.opacity(0.16), lineWidth: 1)
                )
        )
    }
}
