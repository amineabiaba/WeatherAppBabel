//
//  HourlyWeatherForecastView.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import SwiftUI

struct HourlyWeatherForecastView : View {
    
    @ObservedObject var city: City
    
    private let rowHeight: CGFloat = 110
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(city.weather?.hours ?? []) { hour in
                    VStack(spacing: 16) {
                        Text(hour.time.formattedHour)
                            .font(.footnote)
                        ForEach(hour.weatherList ) { item in
                            UrlImageView(urlString: "https://openweathermap.org/img/wn/\(item.icon)@2x.png").frame(width: 20, height: 20, alignment: .center)
                            .font(.body)
                        }
                        Text(hour.temp.formattedTemperature)
                            .font(.headline)
                    }
                }
            }
            .padding([.trailing, .leading])
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .padding([.top, .bottom])
    }
    
}

//#if DEBUG
//struct CityHourlyView_Previews : PreviewProvider {
//    @State static var city: City = City()
//    static var previews: some View {
//        CityHourlyView(city: city)
//    }
//}
//#endif
