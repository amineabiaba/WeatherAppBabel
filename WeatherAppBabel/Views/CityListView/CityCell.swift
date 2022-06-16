//
//  CityCell.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import SwiftUI

struct CityCell : View {
    
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
    var body: some View {
        NavigationLink(destination: CityWeatherDetailView(city: city)) {
            HStack(alignment: .firstTextBaseline) {
                Text(city.name)
                    .lineLimit(nil)
                    .font(.headline)
                Spacer()
                HStack {
                    ForEach(city.weather?.current.weatherList ?? []) { item in
                        UrlImageView(urlString: "https://openweathermap.org/img/wn/\(item.icon)@2x.png").frame(width: 50, height: 50, alignment: .center)
                    }
                    .foregroundColor(Color.gray)
                    VStack {
                        Text(temperature)
                            .foregroundColor(.gray)
                            .font(.headline)
                        HStack{
                            Text(humidity)
                                .foregroundColor(.gray)
                                .font(.headline)
                            Image(systemName: "humidity.fill")
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
            }
            .padding([.trailing, .top, .bottom])
        }
        .redacted(reason: city.isLoading! ? .placeholder : [])
    }
    
}

//#if DEBUG
//struct CityCell_Previews : PreviewProvider {
//    static var previews: some View {
//        CityRow()
//    }
//}
//#endif
