
import SwiftUI
struct WeatherResponse: Decodable {
    let current: CurrentWeather
}

struct CurrentWeather: Decodable {
    let temp_c: Double
    let humidity: Int
    let wind_kph: Double   
    let condition: WeatherCondition
}

struct WeatherCondition: Decodable {
    let text: String
    let icon: String
}

struct ForecastResponse: Decodable {
    let forecast: Forecast
}

struct Forecast: Decodable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Decodable {
    let date: String
    let day: DayForecast
}

struct DayForecast: Decodable {
    let maxtemp_c: Double
    let mintemp_c: Double
    let condition: WeatherCondition
}
