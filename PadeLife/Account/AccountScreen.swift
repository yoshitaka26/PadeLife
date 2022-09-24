//
//  AccountScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct AccountScreen: View {
    @StateObject private var authSubject = AuthSubject()
    var user: PLUser = mockUser
    var body: some View {
        NavigationStack {
            if authSubject.isLogin {
                ZStack {
                    VStack {
                        if let imageUrl = user.imageUrl {
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFit()
                                
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                                .foregroundColor(.secondary)
                        }
                        Text(user.name)
                        Text(user.genderValueString)
                        Text(user.profile)
                        Button {
                            authSubject.signOut()
                        } label: {
                            Text("ログアウト")
                                .defaultButtonText()
                        }
                        .padding(.top, 20)
                    }
                    .font(.headline)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .isHidden(!authSubject.isLoading)
                }
            } else {
                LoginScreen(authSubject: authSubject)
            }
        }
        .task {
            authSubject.checkLoginState()
        }
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen(user: mockUser)
    }
}
