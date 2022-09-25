//
//  ScheduleStatus.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import Foundation

enum ScheduleStatus: Int, CaseIterable, Identifiable {
    case planed
    case reserved
    case canceled
    case none
    
    var id: Int { rawValue }
    
    var stringValue: String {
        switch self {
        case .planed: return "予定"
        case .reserved: return "予約済み"
        case .canceled: return "中止"
        case .none:  return "保留"
        }
    }
}
