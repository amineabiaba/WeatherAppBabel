//
//  AddCityView.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import SwiftUI

struct AddCityView : View {
    
    @State private var search: String = ""
    @State private var isValidating: Bool = false
    @State private var showToast = false
    @State private var txtToast = ""
    @ObservedObject var completer: CityWeather
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cityList: DefaultCityList
    @EnvironmentObject var keyboardPublisher: KeyboardPublisher
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Search City", text: $search) {
                        self.completer.search(self.search){ isValid in
                            if !isValid {
                                self.txtToast = "the city not found"
                                showToast.toggle()
                            }
                            
                        }
                    }
                    .submitLabel(.search)
                }
                Section {
                    Button(action: {
                        
                        if let city = self.completer.city {
                            self.addCity(from: city)
                           // self.presentationMode.wrappedValue.dismiss()
                        }
                        
                    }) {
                        Text(self.completer.city?.name ?? "" )
                            .foregroundColor(.primary)
                    }
                }
                
                
            }
            .navigationBarTitle(Text("Add City"))
            .navigationBarItems(trailing: cancelButton)
            .listStyle(InsetGroupedListStyle())
            
        }
        .toast(isPresenting: $showToast){

                    // `.alert` is the default displayMode
            AlertToast(displayMode: .alert,
                       type: .error(.orange),
                       title: txtToast)
                    
                    
                }
        
    }
    
    private var cancelButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
        }
        .foregroundColor(.orange)
    }
    
    
    
}

extension AddCityView {
    
    private func addCity(from city: CityWeather.Response) {
        CityValidation.validateCity(withID: String(city.id)) { (result) in
            
            switch result{
            case .success(let city):
                if let city = city {
                    DispatchQueue.main.async {
                        self.isValidating = false
                        self.keyboardPublisher.isKeyboardPresented = false
                        
                        if self.cityList.cities.contains(where: {$0.name.elementsEqual(city.name)}) {
                            completer.city?.name = ""
                            self.txtToast = "has already existed"
                            showToast.toggle()
                            
                        }else{
                            self.cityList.cities.append(city)
                            completer.city?.name = ""
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.isValidating = false
                    
                    
                }
            }
            
            
        }
    }
}

//#if DEBUG
//struct AddCityView_Previews : PreviewProvider {
//    static var previews: some View {
//        AddCityView()
//    }
//}
//#endif
