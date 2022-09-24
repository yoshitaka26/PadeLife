//
//  PLUser.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import Foundation

struct PLUser {
    let id: String
    let email: String
    let name: String
    let gender: Bool?
    let imageUrl: String?
    let profile: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case name
        case gender
        case imageUrl = "image"
        case profile
    }
    
    var genderValueString: String {
        switch gender {
        case true:
            return "男性"
        case false:
            return "女性"
        case nil:
            return "-"
        case .some(_):
            return "-"
        }
    }
}

let mockUser = PLUser(
    id: "0001",
    email: "dummy@dummy.com",
    name: "パデラー",
    gender: true,
    imageUrl: nil,
    profile: "よろしく"
)
