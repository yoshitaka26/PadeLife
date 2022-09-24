//
//  ContentView.swift
//  PadeLife
//
//  Created by Yoshitaka Tanaka on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: TabOption = .Dashboard
    enum TabOption {
        case Search
        case Dashboard
        case Account
    }
    var body: some View {
        TabView(selection: $tabSelection) {
            SearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("さがす")
                }
            DashboardScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("ダッシュボード")
                }
            AccountScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("アカウント")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
