//
//  RegisterScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct RegisterScreen: View {
    @ObservedObject var authSubject: AuthSubject
    @Environment(\.dismiss) var dismiss: DismissAction
    var body: some View {
        ZStack {
            VStack {
                Group {
                    TextField(
                        "Email",
                        text: $authSubject.email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
                    SecureField(
                        "Password",
                        text: $authSubject.password
                    ) {
                        authSubject.createUser()
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
                }
                Button {
                    Task {
                        authSubject.createUser()
                    }
                } label: {
                    Text("アカウント作成")
                        .defaultButtonText()
                }
                .padding(.top, 50)
            }
            .padding(30)
        }
        .alert(authSubject.error?.localizedDescription ?? "", isPresented: $authSubject.didError, presenting: authSubject.error) { _ in
            Button("OK", role: .cancel) {
                dismiss.callAsFunction()
            }
        }
        .task {
            authSubject.makeEmptyTextField()
        }
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .isHidden(!authSubject.isLoading)
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen(authSubject: AuthSubject())
    }
}
