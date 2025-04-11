import SwiftUI
struct CurrentWeatherView: View {
    let weather: CurrentWeather?
    
    var body: some View {
        VStack(spacing: 10) {
            Text("NOW")
                .font(.title2.bold())
            
            if let weather = weather {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(weather.temp_c, specifier: "%.0f")°C")
                            .font(.system(size: 50, weight: .bold))
                        Text(weather.condition.text)
                            .font(.title3)
                    }
                    
                    Spacer()
                    
                    AsyncImage(url: URL(string: "https:\(weather.condition.icon)")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                }
            }
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(15)
    }
}
