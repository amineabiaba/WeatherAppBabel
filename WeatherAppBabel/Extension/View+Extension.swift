//
//  View+Extension.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 16/06/2022.
//

import SwiftUI
import Combine
extension View {
  var keyboardPublisher: AnyPublisher<Bool, Never> {
    Publishers
      .Merge(
        NotificationCenter
          .default
          .publisher(for: UIResponder.keyboardWillShowNotification)
          .map { _ in true },
        NotificationCenter
          .default
          .publisher(for: UIResponder.keyboardWillHideNotification)
          .map { _ in false })
      .debounce(for: .seconds(0.1), scheduler: RunLoop.main)
      .eraseToAnyPublisher()
  }
}
