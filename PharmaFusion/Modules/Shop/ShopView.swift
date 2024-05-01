//
//  ShopView.swift
//  PharmaFusion
//
//  Created by Askar on 01.05.2024.
//

import SwiftUI

struct ShopView: View {
    @State var searchText: String = ""
    let items = Array(repeating: SmallItemView(
        item: ItemSmall(
            title: "Rinoksil, 10 ml",
            price: "2000 tg",
            description: "1 spoon after breakfast"
        )
    ), count: 8)
    let typoItems = ["Allergy", "Heart", "Liver", "Brain", "Smash", "Bob"]
    let filterItems = ["Filters", "Sorting"]
    
    @State private var isShowingBottomSheet = false
    @State private var selectedOption: String? = nil
    
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
                    
                    CollectionView(items: typoItems)
                        .padding(.leading, 16)
                    HStack {
                        Text("List of products")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .medium))
                            .padding(.leading, 16)
                            .padding([.vertical], 4)
                        Spacer()
                    }
                    CollectionView(items: filterItems)
                        .padding(.leading, 16)
                        .bottomSheet(isPresented: $isShowingBottomSheet) {
                            VStack(spacing: 16) {
                                Button("Option 1") {
                                    selectedOption = "Option 1"
                                    isShowingBottomSheet = false
                                }
                                Button("Option 2") {
                                    selectedOption = "Option 2"
                                    isShowingBottomSheet = false
                                }
                                Button("Cancel") {
                                    isShowingBottomSheet = false
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(0..<items.count / 2 + items.count % 2, id: \.self) { row in
                            HStack(spacing: 16) {
                                ForEach(0..<2) { column in
                                    let index = column + row * 2
                                    NavigationLink {
                                        ProductCardView(
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
                                    } label: {
                                        items[index]
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding(.horizontal, 8)
            }
            .background(Color.init(hex: "503DBB"))
            .navigationTitle("Shop")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

#Preview {
    ShopView()
}

extension View {
    func bottomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        modifier(BottomSheet(isPresented: isPresented, content: content))
    }
}
