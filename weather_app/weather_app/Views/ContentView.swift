//
import SwiftUI
struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Weather App")
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.top)
                    
                    CurrentWeatherView(weather: viewModel.currentWeather)
                    ForecastView(forecast: viewModel.forecast)
                    
                    if let weather = viewModel.currentWeather {
                        WeatherDetailsView(weather: weather)
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .toolbar {
                Button(action: { Task { await viewModel.fetchWeather() } }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
            .task { await viewModel.fetchWeather() }
            .alert("Error", isPresented: $viewModel.showError) {
                Button("OK") { }
            } message: {
                Text(viewModel.errorMessage)
            }
        }
    }
}
