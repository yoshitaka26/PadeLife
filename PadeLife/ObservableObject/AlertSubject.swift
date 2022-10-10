//
//  AlertSubject.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/10/10.
//

import SwiftUI

class AlertSubject: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var alertModel: AlertModel?
    
    struct AlertModel {
        var title: String = "エラー"
        var messageView: MessageView?
        var actionView: ActionView
    }
    
    struct MessageView: View {
        var message: String
        var body: some View {
            Text(message)
        }
    }
    
    struct ActionView: View {
        var alertType: AlertType
        enum AlertType {
            case single(text: String, action: (() -> Void)? = nil)
            case double(text: String, action: (() -> Void)? = nil, cancelAction: (() -> Void)? = nil)
        }
        var body: some View {
            switch alertType {
            case .single(let text, let action):
                Button(text, action: action ?? {})
            case .double(let text, let action, let cancelAction):
                Button("キャンセル", action: cancelAction ?? {})
                Button(text, action: action ?? {})
            }
        }
    }
    @MainActor func showErrorAlert(error: Error) {
        self.alertModel = AlertModel(
            messageView: MessageView(message: error.localizedDescription),
            actionView: ActionView(alertType: .single(text: "OK"))
        )
        self.showAlert = true
    }
    @MainActor func showSingleAlert(
        title: String,
        message: String?,
        actionText: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.alertModel = AlertModel(
            title: title,
            messageView: (message != nil) ? MessageView(message: message!) : nil,
            actionView: ActionView(alertType: .single(text: actionText ?? "OK", action: action))
        )
        self.showAlert = true
    }
    @MainActor func showDoubleAlert(
        title: String,
        message: String?,
        actionText: String? = nil,
        action: (() -> Void)? = nil,
        cancelAction: (() -> Void)? = nil
    ) {
        self.alertModel = AlertModel(
            title: title,
            messageView: (message != nil) ? MessageView(message: message!) : nil,
            actionView: ActionView(alertType: .double(
                text: actionText ?? "OK",
                action: action,
                cancelAction: cancelAction
            ))
        )
        self.showAlert = true
    }
}
