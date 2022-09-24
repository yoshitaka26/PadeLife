//
//  PadelLevel.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import Foundation

enum PadelLevel: Int {
    case beginner
    case intermediate
    case advanced
    case proficiency
    case none
    
    var stringValue: String {
        switch self {
        case .beginner: return "初心者"
        case .intermediate: return "中級者"
        case .advanced: return "上級者"
        case .proficiency: return "プロ"
        case .none: return "ミックス"
        }
    }
}
