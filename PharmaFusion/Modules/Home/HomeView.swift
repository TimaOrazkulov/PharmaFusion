//
//  HomeView.swift
//  PharmaFusion
//
//  Created by Askar on 30.04.2024.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    let items: [SmallItemView] = Array(
        repeating: SmallItemView(
            item: ItemSmall(
                title: "Rinoksil, 10 ml",
                price: "2000 tg",
                description: "1 spoon after breakfast"
            )
        ),
        count: 8
    )
    
    private let productCardView = ProductCardView(
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
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 8)
                        TextField("Search", text: $searchText)
                            .padding(.trailing, 16)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .frame(height: 36)
                    .background(Color.white)
                    .cornerRadius(40)
                    .padding(.horizontal, 16)

                    AdCardView()
                        .padding(.horizontal, 8)
                        .padding(.top, 8)
                    AdCardView()
                        .padding(.horizontal, 8)
                    HStack {
                        Text("TOP products 2023")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.leading, 12)
                        Spacer()
                    }
                    
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(0..<items.count / 2 + items.count % 2, id: \.self) { row in
                            HStack(spacing: 16) {
                                ForEach(0..<2) { column in
                                    let index = column + row * 2
                                    items[index]
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.horizontal, 8)
            }
        }
        .background(Color.init(hex: "503DBB"))
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

#Preview {
    HomeView()
}
