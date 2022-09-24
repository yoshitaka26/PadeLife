//
//  RegisterScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct RegisterScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            Group {
                TextField(
                    "Email",
                    text: $email)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.secondary, lineWidth: 1)
                )
                SecureField(
                    "Password",
                    text: $password
                ) {
                    // handleLogin(username: username, password: password)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.secondary, lineWidth: 1)
                )
            }
            Button {
                // アカウント作成処理
            } label: {
                Text("アカウント作成")
                    .bold()
                    .frame(width: 200, height: 40)
                    .foregroundColor(Color.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.secondary, lineWidth: 2)
                    )
            }
            .padding(.top, 20)
        }
        .padding(30)
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
