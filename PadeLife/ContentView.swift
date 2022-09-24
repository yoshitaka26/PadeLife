//
//  ContentView.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: TabOption = .dashboard
    enum TabOption {
        case search
        case dashboard
        case account
    }
    var body: some View {
        TabView(selection: $tabSelection) {
            SearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("さがす")
                }
                .tag(TabOption.search)
            DashboardScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("ダッシュボード")
                }
                .tag(TabOption.dashboard)
            AccountScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("アカウント")
                }
                .tag(TabOption.account)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
