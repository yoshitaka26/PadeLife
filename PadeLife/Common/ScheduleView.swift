//
//  ScheduleView.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct ScheduleView: View {
    var plSchedule: PLSchedule
    
    enum ScheduleViewDestination {
        case detail
        case follow
        case going
    }

    var body: some View {
        ZStack {
            HStack(alignment: .top) {
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
                Spacer()
                HStack(alignment: .top) {
                    Menu {
                        NavigationLink(value: ScheduleViewDestination.follow) {
                            Label {
                                Text("フォロー")
                            } icon: {
                                Image(systemName: "paperclip")
                            }
                        }
                        NavigationLink(value: ScheduleViewDestination.going) {
                            Label {
                                Text("参加する")
                            } icon: {
                                Image(systemName: "checkmark")
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .padding(5)
                    }
                }
            }
            NavigationLink(value: ScheduleViewDestination.detail) {
                EmptyView()
            }
            .opacity(0)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray, lineWidth: 3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .navigationDestination(for: ScheduleViewDestination.self) { destination in
            switch destination {
            case .detail:
                Text("詳細画面開発中")
            case .follow:
                Text("フォロー開発中")
            case .going:
                Text("参加画面開発中")
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScheduleView(plSchedule: mockPLSchedule)
        }
    }
}
