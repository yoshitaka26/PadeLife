//
//  CreateScheduleScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/25.
//

import SwiftUI

struct CreateScheduleScreen: View {
    @State private var selectionDate = Date()
    @State private var selectionHour: Int = 1
    @State private var place: String = ""
    @State private var selectionLevel: PadelLevel = .intermediate
    @State private var selectionStatus: ScheduleStatus = .planed
    @State private var max: Int = 4
    @State private var attend: Int = 1
    
    var max2: Int {
        return max - 1
    }
    
    var need: Int {
        return (max - attend) > 0 ? (max - attend) : 0
    }
    
    var body: some View {
        Form {
            Grid(alignment: .leading, verticalSpacing: 15) {
                GridRow {
                    Image(systemName: "calendar.badge.clock")
                        .frame(width: 40, alignment: .center)
                    Text("日時")
                    VStack(alignment: .trailing, spacing: 0) {
                        DatePicker("", selection: $selectionDate)
                        Picker(selection: $selectionHour) {
                            ForEach(1..<6) {
                                Text($0.description + "時間")
                            }
                        } label: {
                            Text("時間")
                                .foregroundColor(.secondary)
                        }
                        .frame(width:140)
                    }
                }
                GridRow {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 40, alignment: .center)
                    Text("場所")
                    TextField("", text: $place)
                }
                GridRow {
                    Image(systemName: "chart.bar")
                        .frame(width: 40, alignment: .center)
                    Text("レベル")
                    Picker("", selection: $selectionLevel) {
                        ForEach(PadelLevel.allCases) { level in
                            Text(level.stringValue)
                                .tag(level)
                        }
                    }
                }
                GridRow {
                    Image(systemName: "circle.dashed")
                        .frame(width: 40, alignment: .center)
                    Text("状態")
                    Picker("", selection: $selectionStatus) {
                        Text(ScheduleStatus.planed.stringValue).tag(ScheduleStatus.planed)
                        Text(ScheduleStatus.reserved.stringValue).tag(ScheduleStatus.reserved)
                    }
                }
                GridRow {
                    Image(systemName: "person.3")
                        .frame(width: 40, alignment: .center)
                    Text("人数")
                    VStack(alignment: .trailing, spacing: 5) {
                        Picker(selection: $max) {
                            ForEach(2..<10) {
                                Text($0.description + "人")
                            }
                        } label: {
                            Text("開催人数")
                                .foregroundColor(.secondary)
                        }
                        Picker(selection: $attend) {
                            ForEach(1..<10) {
                                Text($0.description + "人")
                            }
                        } label: {
                            Text("うち確保済み")
                                .foregroundColor(.secondary)
                        }
                        Text("募集人数 ") +
                        Text(need.description + "人")
                    }
                }
            }
            .font(.callout)
        }
        
    }
}

struct CreateScheduleScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateScheduleScreen()
    }
}
