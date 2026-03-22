import CoreLocation
import Foundation

final class OpenWeatherService: WeatherService {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherSnapshot {
        let apiKey = try Self.apiKey()

        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")
        components?.queryItems = [
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric")
        ]

        guard let url = components?.url else {
            throw WeatherServiceError.invalidEndpoint
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw WeatherServiceError.invalidResponse
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw WeatherServiceError.requestFailed(statusCode: httpResponse.statusCode)
        }

        do {
            let weatherResponse = try decoder.decode(WeatherAPIResponse.self, from: data)
            return WeatherSnapshot(response: weatherResponse)
        } catch {
            throw WeatherServiceError.decodingFailed
        }
    }

    private static func apiKey() throws -> String {
        let rawValue = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        let apiKey = rawValue?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        guard !apiKey.isEmpty, !apiKey.contains("YOUR_OPENWEATHER_API_KEY"), !apiKey.contains("$(") else {
            throw WeatherServiceError.missingAPIKey
        }

        return apiKey
    }
}
