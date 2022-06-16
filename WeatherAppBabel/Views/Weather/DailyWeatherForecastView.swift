//
//  DailyWeatherForecastView.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import SwiftUI

struct DailyWeatherForecastView : View {
    
    @State var day: DailyWeather
    var fiveDays:Int = 0
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                Text(day.time.formattedDay)
                Spacer()
                HStack(spacing: 16) {
                    verticalTemperatureView(min: true)
                    verticalTemperatureView(min: false)
                }
            }
            HStack(alignment: .center) {
                Spacer()
                ForEach(day.weatherList ) { item in
                    UrlImageView(urlString: "https://openweathermap.org/img/wn/\(item.icon)@2x.png").frame(width: 30, height: 30, alignment: .center)
                    
                  //  self.fiveDays=fiveDays+1
                }
                    .font(.body)
                Spacer()
            }
        }
    }
   
    func verticalTemperatureView(min: Bool) -> some View {
        VStack(alignment: .trailing) {
            Text(min ? "min" : "max")
                .font(.footnote)
                .foregroundColor(.gray)
            Text(min ? day.temp.min.formattedTemperature : day.temp.max.formattedTemperature)
                .font(.headline)
        }
    }
    
}

//#if DEBUG
//struct CityDailyView_Previews : PreviewProvider {
//    static var previews: some View {
//        CityDailyView(day: daily)
//    }
//}
//#endif


