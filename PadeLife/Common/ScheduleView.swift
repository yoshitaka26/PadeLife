//
//  ScheduleView.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct ScheduleView: View {
    var body: some View {
        VStack {
            Grid(alignment: .leading, verticalSpacing: 5) {
                GridRow {
                    Image(systemName: "calendar.badge.clock")
                        .frame(width: 40, alignment: .center)
                    Text("日時")
                    Text("item.date")
                }
                GridRow {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 40, alignment: .center)
                    Text("場所")
                    Text("item.place")
                }
                GridRow {
                    Image(systemName: "chart.bar")
                        .frame(width: 40, alignment: .center)
                    Text("レベル")
                    Text("item.place")
                }
                GridRow {
                    Image(systemName: "circle.dashed")
                        .frame(width: 40, alignment: .center)
                    Text("状態")
                    Text("item.status")
                }
                GridRow {
                    Image(systemName: "person.3")
                        .frame(width: 40, alignment: .center)
                    Text("人数")
                    Text("item.person / item.max")
                }
            }
            .font(.callout)
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
