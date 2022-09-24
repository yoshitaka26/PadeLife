//
//  DashboardScreen.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/24.
//

import SwiftUI

struct DashboardScreen: View {
    @State private var createSchedule: Bool = false
    enum DashboardDestination {
        case organized
        case reserved
        case followed
    }
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
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
                Button {
                    createSchedule = true
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.horizontal, 30)
                        .foregroundColor(.secondary)
                }
            }
            .navigationDestination(isPresented: $createSchedule, destination: {
                Text("開発中")
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
        }
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
