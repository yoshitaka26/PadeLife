//
//  SearchScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct SearchScreen: View {
    var pLSchedules: [PLSchedule] = [mockPLSchedule, mockPLSchedule]
    var body: some View {
        NavigationStack {
            List(pLSchedules, id: \.id) { schedule in
                ScheduleView(plSchedule: schedule)
            }
            .listStyle(.inset)
            .listRowSeparator(.hidden)
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
