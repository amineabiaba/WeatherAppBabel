//
//  CityWeatherDetailView.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import SwiftUI

struct CityWeatherDetailView : View {
    
    @ObservedObject var city: City
    @State var isRefrechDetail: Bool = false
    @State private var isAnimating = false
    var body: some View {
        List {
            Section(header: Text("Now")) {
                CurrentWeatherForecastView(city: city)
            }
            
            Section(header: Text("Hourly")) {
                HourlyWeatherForecastView(city: city)
            }
            
            Section(header: Text("This week")) {
                ForEach(city.weather?.week ?? []) { day in
                    DailyWeatherForecastView(day: day)
                }
            }
        }
        .navigationBarItems(trailing: refreshButton)
        .navigationBarTitle(Text(city.name))
        .redacted(reason: city.isLoading! ? .placeholder : [])
    }
    
    private var refreshButton: some View {
        HStack {
            Button(action: {
                city.loadingState(state: true)
            }) {
                Image(systemName: "arrow.clockwise")
                .font(.title2)
                .foregroundColor(.orange)
            }.sheet(isPresented: $isRefrechDetail) {

               
            }
        }
       
    }
    
}

//#if DEBUG
//struct CityWeatherView_Previews : PreviewProvider {
//    @State static var cit: City = City()
//    static var previews: some View {
//        CityWeatherView(city: cit)
//    }
//}
//#endif
