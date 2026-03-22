import Foundation

extension Double {
    private var roundedString: String {
        String(format: "%.0f", self)
    }

    var temperatureText: String {
        "\(roundedString)°"
    }

    var percentageText: String {
        "\(roundedString)%"
    }

    var windSpeedText: String {
        "\(roundedString) m/s"
    }

    var pressureText: String {
        "\(roundedString) hPa"
    }
}
