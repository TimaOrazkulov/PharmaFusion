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
            NavigationView(content: {
                HomeView()
            })
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            NavigationView(content: {
                ShopView()
            })
            .tabItem {
                Image(systemName: "cart.fill")
                Text("Shop")
            }
            ProductView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("Tracking")
                }
            Text("Fourth Tab")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabbarController()
}
