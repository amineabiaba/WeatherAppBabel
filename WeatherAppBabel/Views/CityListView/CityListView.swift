//
//  CityListView.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import SwiftUI

struct CityListView : View {
    @EnvironmentObject var cityList: DefaultCityList
    @StateObject var completer = CityWeather()
    @State var isPresentingModal: Bool = false
    @State private var isEditing: Bool = false
    @State private var searchCity = ""
    @EnvironmentObject var keyboardPublisher: KeyboardPublisher
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("List Cities")) {
                    ForEach(searchResults, id: \.name) { city in
                        CityCell(city: city)
                    }
                    .onDelete(perform: delete)
                }
                .onReceive(keyboardPublisher) { value in
                    keyboardPublisher.isKeyboardPresented = value
                }
                
            }
            .disabled(keyboardPublisher.isKeyboardPresented ?? false)
            .searchable(text: $searchCity, placement: .navigationBarDrawer(displayMode: .always))
            .listStyle(.insetGrouped )
            .navigationBarItems(leading: EditButton()
                .font(.title2)
                .foregroundColor(.orange),
                                trailing: addCity)
            
            .navigationBarTitle(Text("Weather App"))
        }
        
        
        
    }
    var searchResults: [City] {
        if searchCity.isEmpty {
            return cityList.cities
        } else {
            return cityList.cities.filter { $0.name.contains(searchCity) }
        }
    }
    
    private var addCity: some View {
        HStack {
            Button(action: {
                self.isPresentingModal = true
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                    .foregroundColor(.orange)
            }.sheet(isPresented: $isPresentingModal) {
                
                AddCityView(completer: completer)
                    .environmentObject(self.cityList)
                    .environmentObject(self.keyboardPublisher)
            }
        }
        
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            cityList.cities.remove(at: index)
        }
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        var removeCities: [City] = []
        
        for index in source {
            removeCities.append(cityList.cities[index])
            cityList.cities.remove(at: index)
        }
        
        cityList.cities.insert(contentsOf: removeCities, at: destination)
    }
    
}

//#if DEBUG
//struct CityListView_Previews : PreviewProvider {
//    static var previews: some View {
//        CityListView()
//    }
//}
//#endif
