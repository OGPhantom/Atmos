import Foundation

struct WeatherSnapshot {
    let cityName: String
    let conditionCode: Int
    let conditionTitle: String
    let conditionDescription: String
    let temperature: Double
    let feelsLike: Double
    let minTemperature: Double
    let maxTemperature: Double
    let windSpeed: Double
    let humidity: Double
    let pressure: Double
    let fetchedAt: Date

    init(response: WeatherAPIResponse, fetchedAt: Date = .now) {
        let primaryCondition = response.weather.first

        cityName = response.name
        conditionCode = primaryCondition?.id ?? 800
        conditionTitle = primaryCondition?.main ?? "Clear"
        conditionDescription = primaryCondition?.description.capitalized ?? "Clear sky"
        temperature = response.main.temp
        feelsLike = response.main.feels_like
        minTemperature = response.main.temp_min
        maxTemperature = response.main.temp_max
        windSpeed = response.wind.speed
        humidity = response.main.humidity
        pressure = response.main.pressure
        self.fetchedAt = fetchedAt
    }

    var systemImageName: String {
        switch conditionCode {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "snowflake"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.sun.fill"
        default:
            return "cloud.fill"
        }
    }

    var overviewText: String {
        "Expect \(conditionDescription.lowercased()) with a feels-like temperature of \(feelsLike.temperatureText)."
    }

    var lastUpdatedText: String {
        fetchedAt.formatted(date: .abbreviated, time: .shortened)
    }
}

extension WeatherSnapshot {
    static let preview = WeatherSnapshot(
        response: WeatherAPIResponse(
            weather: [
                .init(id: 600, main: "Snow", description: "light snow", icon: "13d")
            ],
            main: .init(
                temp: -2,
                feels_like: -5,
                temp_min: -4,
                temp_max: 1,
                pressure: 1016,
                humidity: 88
            ),
            name: "Kyiv",
            wind: .init(speed: 6)
        )
    )
}
