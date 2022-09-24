//
//  AuthSubject.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AuthSubject: ObservableObject {
    @AppStorage("isLogin") var isLogin: Bool = false
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var didError: Bool = false
    @Published var error: Error? = nil
}

extension AuthSubject {
    func checkLoginState() {
        if Auth.auth().currentUser != nil {
          isLogin = true
        } else {
          isLogin = false
        }
    }
    
    func createUser() {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) {  [weak self] authResult, error in
            guard let self = self else { return }
            self.isLoading = false
            self.error = error
            if error == nil {
                self.isLoading = false
                self.isLogin = true
            } else {
                self.isLoading = false
                self.didError = true
            }
        }
    }
    
    func signIn() {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            self.isLoading = false
            self.error = error
            if error == nil {
                self.isLogin = true
            } else {
                self.didError = true
            }
        }
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            isLoading = true
            try firebaseAuth.signOut()
            isLogin = false
            isLoading = false
        } catch let signOutError as NSError {
            isLoading = false
            self.error = signOutError
            self.didError = true
        }
    }
    
    func resetPassword() {
        isLoading = true
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            guard let self = self else { return }
            self.isLoading = false
            if error == nil {
                self.isLoading = false
            } else {
                self.error = error
                self.didError = true
            }
        }
    }
}
