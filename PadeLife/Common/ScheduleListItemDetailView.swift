//
//  ScheduleListItemDetailView.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct ScheduleListItemDetailView: View {
    var plSchedule: PLSchedule
    var body: some View {
        Grid(alignment: .leading, verticalSpacing: 5) {
            GridRow {
                Image(systemName: "calendar.badge.clock")
                    .frame(width: 40, alignment: .center)
                Text("日時")
                Text(plSchedule.date.description)
            }
            GridRow {
                Image(systemName: "mappin.and.ellipse")
                    .frame(width: 40, alignment: .center)
                Text("場所")
                Text(plSchedule.place)
            }
            GridRow {
                Image(systemName: "chart.bar")
                    .frame(width: 40, alignment: .center)
                Text("レベル")
                Text(plSchedule.levelValue)
            }
            GridRow {
                Image(systemName: "circle.dashed")
                    .frame(width: 40, alignment: .center)
                Text("状態")
                Text(plSchedule.statusValue)
            }
            GridRow {
                Image(systemName: "person.3")
                    .frame(width: 40, alignment: .center)
                Text("人数")
                Text(plSchedule.participantNumber.description) +
                Text("／") +
                Text(plSchedule.maximumNumber.description)
            }
        }
        .font(.callout)
    }
}

struct ScheduleListItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListItemDetailView(plSchedule: mockPLSchedule)
    }
}
