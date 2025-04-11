
import SwiftUI
struct WeatherService {
    private let apiKey = "8cd38adec70b4d3a9a7235113251004" 
    private let baseURL = "https://api.weatherapi.com/v1"
    
    func fetchCurrentWeather() async throws -> CurrentWeather {
        let endpoint = "\(baseURL)/current.json?key=\(apiKey)&q=London&lang=ru"
        guard let url = URL(string: endpoint) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return response.current
    }
    
    func fetchForecast() async throws -> ForecastResponse {
        let endpoint = "\(baseURL)/forecast.json?key=\(apiKey)&q=London&days=3&lang=ru"
        guard let url = URL(string: endpoint) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ForecastResponse.self, from: data)
    }
}
