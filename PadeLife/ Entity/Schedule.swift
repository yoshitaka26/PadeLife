//
//  Schedule.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import Foundation

struct PLSchedule {
    let id: UUID
    let place: String
    let date: String
    let level: Int
    let status: Int
    let participantNumber: Int
    let maximumNumber: Int

    var levelValue: String {
        (PadelLevel(rawValue: level) ?? .none).stringValue
    }
    var statusValue: String {
        (ScheduleStatus(rawValue: status) ?? .none).stringValue
    }
}

var mockPLSchedule = PLSchedule(
    id: UUID(),
    place: "Padel Tokyo",
    date: "2022/12/20",
    level: 2,
    status: 3,
    participantNumber: 1,
    maximumNumber: 4
)
