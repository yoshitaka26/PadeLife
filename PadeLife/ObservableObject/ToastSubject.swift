//
//  ToastSubject.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/10/10.
//

import SwiftUI

class ToastSubject: ObservableObject {
    @Published var toastMessage: String = ""
    @Published var showToastAlert: Bool = false
    
    var toast: some View {
        Text(toastMessage)
            .frame(width: 250.0, height: 50.0)
            .background(Color.secondary)
            .foregroundColor(Color.white)
            .cornerRadius(25.0, antialiased: true)
    }
    @MainActor func showToastAlert(message: String) {
        self.toastMessage = message
        self.showToastAlert = true
    }
}
