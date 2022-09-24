//
//  LoginScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct LoginScreen: View {
    @ObservedObject var authSubject: AuthSubject
    @State private var register: Bool = false
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
                        Task {
                            authSubject.createUser()
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
                }
                Button {
                    Task {
                        authSubject.signIn()
                    }
                } label: {
                    Text("ログイン")
                        .defaultButtonText()
                }
                .padding(.top, 50)
                Button {
                    Task {
                        authSubject.resetPassword()
                    }
                } label: {
                    Text("パスワードリセット")
                        .defaultButtonText()
                }
                .padding(.top, 20)
                Button {
                    register = true
                } label: {
                    Text("アカウントを作る")
                        .defaultButtonText()
                }
                .padding(.top, 20)
            }
            .padding(30)
            .navigationDestination(isPresented: $register) {
                RegisterScreen(authSubject: authSubject)
            }
            .alert(authSubject.error?.localizedDescription ?? "", isPresented: $authSubject.didError, presenting: authSubject.error) { _ in
                Button("キャンセル", role: .cancel) {
                    dismiss.callAsFunction()
                }
            }
        }
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .isHidden(!authSubject.isLoading)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(authSubject: AuthSubject())
    }
}
