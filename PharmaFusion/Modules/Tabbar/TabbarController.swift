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
            productCardView
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
