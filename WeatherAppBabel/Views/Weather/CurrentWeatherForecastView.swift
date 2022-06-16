//
//  CurrentWeatherForecastView.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import SwiftUI

struct CurrentWeatherForecastView: View {
    
    @ObservedObject var city: City
    
    var temperature: String {
        guard let temperature = city.weather?.current.temp else {
            return "-ºC"
        }
        return temperature.formattedTemperature
    }
    var humidity: String {
        guard let humidity = city.weather?.current.humidity else {
            return "-"
        }
        return humidity.formattedDouble+"%"
    }
    var pressure: String {
        guard let pressure = city.weather?.current.pressure else {
            return "-"
        }
        return pressure.formattedDouble
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                ForEach(city.weather?.current.weatherList ?? []) { item in
                    UrlImageView(urlString: "https://openweathermap.org/img/wn/\(item.icon)@2x.png").frame(width: 80, height: 80, alignment: .leading)
                }
                .font(.title3)
                VStack {
                    Text(temperature)
                        .foregroundColor(.white)
                        .font(.title3)
                    HStack{
                        Text(humidity)
                            .foregroundColor(.white)
                            .font(.title3)
                        Image(systemName: "humidity.fill")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Text(pressure)
                            .foregroundColor(.white)
                            .font(.title3)
                        Image(systemName: "digitalcrown.press")
                            .foregroundColor(.gray)
                    }
                    
                    
                    
                }
            }
            Spacer()
        }
        .frame(height: 110)
    }
    
}

//#if DEBUG
//struct CityHeader_Previews : PreviewProvider {
//    @State static var city:City = City()
//    static var previews: some View {
//        CityHeaderView(city: city)
//    }
//}
//#endif
