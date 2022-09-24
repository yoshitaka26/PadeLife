//
//  ScheduleView.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct ScheduleListItemView: View {
    var plSchedule: PLSchedule
    
    enum ScheduleViewDestination {
        case detail
        case follow
        case going
    }

    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                ScheduleListItemDetailView(plSchedule: plSchedule)
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
            ScheduleListItemView(plSchedule: mockPLSchedule)
        }
    }
}
