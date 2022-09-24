//
//  PadelSubject.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class PadelSubject: ObservableObject {
    @AppStorage("userId") var userId: String = ""
    @AppStorage("userEmail") var userEmail: String = ""
    
    @Published var myData: PLUser? = nil
    
    @Published var isLoading: Bool = false
    @Published var didError: Bool = false
    @Published var error: Error? = nil
    
    var isLogin: Bool {
        !userId.isEmpty
    }
}

extension PadelSubject {
    func fetchUserData() {
        guard isLogin else { return }
        let db = Firestore.firestore()
        db.collection("users").whereField("id", isEqualTo: userId)
            .getDocuments() { [weak self] (querySnapshot, err) in
                guard let self = self else { return }
                if let err = err {
                    self.didError = true
                    self.error = err
                } else {
                    if let snapShot = querySnapshot,
                       let document = snapShot.documents.first {
                        self.myData = PLUser(
                            id: document["id"] as! String,
                            email: document["email"] as! String,
                            name: document["name"] as! String,
                            gender: document["gender"] as? Bool,
                            imageUrl: document["imageUrl"] as? String,
                            profile: document["profile"] as! String
                        )
                    } else {
                        self.createUserData()
                    }
                }
            }
    }
    
    func createUserData() {
        guard isLogin else { return }
        let db = Firestore.firestore()
        var ref: DocumentReference?
        ref = db.collection("users").addDocument(data: [
            "id": userId,
            "email": userEmail,
            "name": "ゲスト",
            "gender": nil,
            "image": nil,
            "profile": ""
        ]) { err in
            if let err = err {
                self.didError = true
                self.error = err
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
