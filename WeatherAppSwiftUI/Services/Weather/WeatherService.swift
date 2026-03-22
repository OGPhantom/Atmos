import CoreLocation

protocol WeatherService {
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherSnapshot
}

enum WeatherServiceError: LocalizedError {
    case missingAPIKey
    case invalidEndpoint
    case invalidResponse
    case requestFailed(statusCode: Int)
    case decodingFailed

    var errorDescription: String? {
        switch self {
        case .missingAPIKey:
            return "Add a valid OpenWeather API key to Secrets.xcconfig before running the app."
        case .invalidEndpoint:
            return "The weather endpoint could not be created."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .requestFailed(let statusCode):
            return "The weather request failed with status code \(statusCode)."
        case .decodingFailed:
            return "The weather payload could not be decoded."
        }
    }
}
