import Foundation

struct WeatherAPIResponse: Decodable {
    let weather: [WeatherCondition]
    let main: Main
    let name: String
    let wind: Wind

    struct WeatherCondition: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct Main: Decodable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }

    struct Wind: Decodable {
        let speed: Double
    }
}
