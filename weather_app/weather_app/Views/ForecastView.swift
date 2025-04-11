import SwiftUI
struct ForecastView: View {
    let forecast: [ForecastDay]?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Weather Forecast")
                .font(.title2.bold())
            
            if let forecast = forecast {
                ForEach(forecast.prefix(3), id: \.date) { day in
                    ForecastDayView(day: day)
                }
            }
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(15)
    }
}

struct ForecastDayView: View {
    let day: ForecastDay
    
    var body: some View {
        HStack {
            Text(day.date.formattedAsShortDate())
                .frame(width: 100, alignment: .leading)
            
            Spacer()
            
            AsyncImage(url: URL(string: "https:\(day.day.condition.icon)")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 30, height: 30)
            
            Spacer()
            
            Text("\(day.day.maxtemp_c, specifier: "%.0f")° / \(day.day.mintemp_c, specifier: "%.0f")°")
                .frame(width: 100, alignment: .trailing)
        }
    }
}
extension String {
    func formattedAsShortDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: self) else { return self }
        
        formatter.dateFormat = "E, d MMM"
        return formatter.string(from: date)
    }
}
