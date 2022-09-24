//
//  DashboardScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct DashboardScreen: View {
    enum DashboardDestination {
        case organized
        case reserved
        case followed
    }
    var body: some View {
        NavigationStack {
            List {
                Section("主催") {
                    NavigationLink(value: DashboardDestination.organized) {
                        ScheduleListItemDetailView(plSchedule: mockPLSchedule)
                    }
                }
                Section("参加中") {
                    NavigationLink(value: DashboardDestination.reserved) {
                        ScheduleListItemDetailView(plSchedule: mockPLSchedule)
                    }
                }
                Section("フォロー中") {
                    NavigationLink(value: DashboardDestination.reserved) {
                        ScheduleListItemDetailView(plSchedule: mockPLSchedule)
                    }
                }
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
