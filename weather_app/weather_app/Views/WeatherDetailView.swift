//
import SwiftUI
struct WeatherDetailsView: View {
    let weather: CurrentWeather
    
    var body: some View {
        HStack(spacing: 15) {
            DetailItem(icon: "humidity", value: "\(weather.humidity)%", label: "Humidity")
            DetailItem(icon: "wind", value: "\(weather.wind_kph) km/h", label: "Wind")
        }
        .padding(.horizontal)
    }
    
    private struct DetailItem: View {
        let icon: String
        let value: String
        let label: String
        
        var body: some View {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                
                Text(value)
                    .font(.headline)
                
                Text(label)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.tertiarySystemGroupedBackground))
            .cornerRadius(10)
        }
    }
}
