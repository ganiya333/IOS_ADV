
import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var currentWeather: CurrentWeather?
    @Published var forecast: [ForecastDay]?
    @Published var showError = false
    @Published var errorMessage = ""
    
    private let service = WeatherService()
    
    func fetchWeather() async {
        do {
            async let current = service.fetchCurrentWeather()
            async let forecast = service.fetchForecast()
            
            let (currentResult, forecastResult) = await (try current, try forecast)
            
            self.currentWeather = currentResult
            self.forecast = forecastResult.forecast.forecastday
        } catch {
            errorMessage = error.localizedDescription
            showError = true
        }
    }
}
