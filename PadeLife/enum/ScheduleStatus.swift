//
//  ScheduleStatus.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import Foundation

enum ScheduleStatus: Int {
    case planed
    case reserved
    case canceled
    case none
    
    var stringValue: String {
        switch self {
        case .planed: return "予定"
        case .reserved: return "予約済み"
        case .canceled: return "中止"
        case .none:  return "保留"
        }
    }
}
