//
//  TabbarController.swift
//  PharmaFusion
//
//  Created by Askar on 29.04.2024.
//

import SwiftUI

struct TabbarController: View {
    private let productCardView =  ProductCardView(
        productCard: .init(
            productName: "Ketonal 100 mg",
            price: "$4.99",
            manufacturer: "Slovenia",
            dosage: "100mg",
            description: "Reduces the amount of secretion, ensures patency of the nasal passages, and introduces nasal breathing. Effectively relieves nasal congestion.",
            pharmacies: [
                Pharmacy(name: "Sadykhan pharmacy", rating: "4.8 $", reviewCount: 18, deliveryTime: "20:09", pickupTime: "20:09"),
                Pharmacy(name: "Rauza pharmacy", rating: "6.8 $", reviewCount: 18, deliveryTime: "20:09", pickupTime: "20:09"),
                Pharmacy(name: "Apteka+ pharmacy", rating: "10.8 $", reviewCount: 18, deliveryTime: "20:09", pickupTime: "20:09")
            ],
            reviews: [
                Review(author: "Yasmin U.", text: "Amazing spray!! Helped me with my nose problem!"),
                Review(author: "Yasmin U.", text: "Amazing spray!! Helped me with my nose problem!")
            ]

        )
    )
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tint(.white)
            NavigationStack {
                ShopView()
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text("Shop")
            }
            .tint(.white)
//            NavigationView(content: {
//                ProductView()
//            })
//            .tabItem {
//                Image(systemName: "list.clipboard")
//                Text("Tracking")
//            }
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
            .tint(.white)
        }
        .tint(.init(hex: "503DBB"))
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    TabbarController()
}
