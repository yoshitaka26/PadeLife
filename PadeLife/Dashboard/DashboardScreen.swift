//
//  DashboardScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct DashboardScreen: View {
    @StateObject private var padelSubject = PadelSubject()
    @State private var createSchedule: Bool = false
    enum DashboardDestination {
        case organized
        case reserved
        case followed
    }
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                List {
                    Text(Bundle.main.object(forInfoDictionaryKey: "appNameSetting") as! String)
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
                Button {
                    createSchedule = true
                } label: {
                    Label {
                        Text("主催イベント作成")
                            .bold()
                    } icon: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.bottom, 20)
                    .foregroundColor(.secondary)
                }
            }
            .navigationDestination(isPresented: $createSchedule, destination: {
                CreateScheduleScreen()
            })
            .navigationDestination(for: DashboardDestination.self) { destination in
                switch destination {
                case .organized:
                    Text("開発中")
                case .reserved:
                    Text("開発中")
                case .followed:
                    Text("開発中")
                }
            }
            .task {
                padelSubject.fetchUserData()
            }
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
