//
//  TabbarController.swift
//  PharmaFusion
//
//  Created by Askar on 29.04.2024.
//

import SwiftUI

struct TabbarController: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
            ShopView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
            ProductView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
            Text("Fourth Tab")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
        }
    }
}

#Preview {
    TabbarController()
}
