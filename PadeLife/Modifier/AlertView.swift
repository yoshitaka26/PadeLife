//
//  AlertView.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/10/10.
//

import SwiftUI

struct AlertView: ViewModifier {
    @ObservedObject var alertSubject: AlertSubject
    
    func body(content: Content) -> some View {
        content
            .alert(
                alertSubject.alertModel?.title ?? "",
                isPresented: $alertSubject.showAlert,
                presenting: alertSubject.alertModel
            ) { alertModel in
                alertModel.actionView
            } message: { alertModel in
                alertModel.messageView
            }
    }
}
