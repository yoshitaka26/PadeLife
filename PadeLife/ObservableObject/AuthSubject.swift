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
    @AppStorage("userId") var userId: String = ""
    @AppStorage("userEmail") var userEmail: String = ""
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var didError: Bool = false
    @Published var error: Error? = nil
    
    var isLogin: Bool {
        !userId.isEmpty
    }
    
    func makeEmptyTextField() {
        email = ""
        password = ""
    }
}

extension AuthSubject {
    func checkLoginState() {
        if let user = Auth.auth().currentUser {
            userId = user.uid
        } else {
            userId = ""
            email = userEmail
            password = ""
        }
    }
    
    func createUser() {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            self.isLoading = false
            self.error = error
            if error == nil {
                self.isLoading = false
                self.userId = Auth.auth().currentUser?.uid ?? ""
                self.userEmail = self.email
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
                self.userId = Auth.auth().currentUser?.uid ?? ""
                self.userEmail = self.email
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
            userId = ""
            password = ""
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
