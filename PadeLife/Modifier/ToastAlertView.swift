//
//  ToastAlertView.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/10/10.
//

import SwiftUI
import PopupView

struct ToastAlertView: ViewModifier {
    @ObservedObject var toastSubject: ToastSubject

    func body(content: Content) -> some View {
        content
            .popup(
                isPresented: $toastSubject.showToastAlert,
                type: .floater(verticalPadding: 50.0),
                animation: .easeIn,
                autohideIn: 2.0
            ) {
                toastSubject.toast
            }
    }
}
