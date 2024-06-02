//
//  ProductCardView.swift
//  PharmaFusion
//
//  Created by Askar on 01.05.2024.
//

import SwiftUI

struct ProductCardView: View {
    @State private var currentPage = 0
    let productCard: ProductCard
    @State private var cardIsPresented = false
    @State private var addressChoiceIsPresented = false
    @State private var addressIsPresented = false
    @State private var isFinished = false

    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    TabView(selection: $currentPage) {
                        Image("ketonal")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.bottom, 48)
                            .padding(.horizontal, 32)
                            .tag(0)
                        Image("ketonal")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.bottom, 48)
                            .padding(.horizontal, 32)
                            .tag(1)
                        Image("ketonal")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.bottom, 48)
                            .padding(.horizontal, 32)
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .padding(.top, 16)
                    .background(Color.init(hex: "CAC5EB"))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .frame(height: 300)
                }
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading) {
                    Text(productCard.productName)
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)

                    HStack {
                        Text("From:")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(productCard.price)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .background(Color.init(hex: "CAC5EB"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    HStack {
                        Text("Dosage:")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(productCard.dosage)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .background(Color.init(hex: "CAC5EB"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    HStack {
                        Text("Manufacturer:")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(productCard.manufacturer)
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                    Text(productCard.description)
                        .padding(.top)
                        .foregroundStyle(.white)
                }
                .padding()
                .padding(.bottom, 16)

                // Pharmacies
                VStack(alignment: .leading) {
                    Text("Pharmacies")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                        .padding(.horizontal, 16)
                        .foregroundStyle(.white)
                    ForEach(productCard.pharmacies, id: \.id) { pharmacy in
                        PharmacyRow(pharmacy: pharmacy, action: {
                            cardIsPresented = true
                        })
                    }
                }

                // Reviews
                VStack(alignment: .leading) {
                    Text("Reviews")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                        .foregroundStyle(.white)
                    ForEach(productCard.reviews, id: \.id) { review in
                        ReviewRow(review: review)
                    }
                }
                .padding()
                NavigationLink(destination: ProductPaymentView(), isActive: $isFinished) {
                    EmptyView()
                }
            }
            .padding(.bottom, 60)
            .background(Color.init(hex: "503DBB"))
        }
        .bottomSheet(isPresented: $cardIsPresented, content: {
            ProductView {
                withAnimation {
                    cardIsPresented = false
                }
            } buyAction: {
                cardIsPresented = false
                addressChoiceIsPresented = true
            } basketAction: {
                withAnimation {
                    cardIsPresented = false
                }
            }
        })
        .bottomSheet(isPresented: $addressChoiceIsPresented, content: {
            ProductCardAddressChoiceView {
                withAnimation {
                    addressChoiceIsPresented = false
                }
            } deliveryAction: {
                addressIsPresented = true
            } addressAction: {
                addressChoiceIsPresented = false
                isFinished = true
            }
        })
        .bottomSheet(isPresented: $addressIsPresented, content: {
            ProductAddressView {
                withAnimation {
                    addressIsPresented = false
                    isFinished = true
                }
            } closeAction: {
                withAnimation {
                    addressIsPresented = false
                }
            }
        })
        .navigationTitle("Product Card")
        .navigationBarTitleDisplayMode(.large)
        .background(Color.init(hex: "503DBB"))
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct Pharmacy: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let rating: String
    let reviewCount: Int
    let deliveryTime: String
    let pickupTime: String
}

struct Review: Identifiable, Hashable {
    let id = UUID()
    let author: String
    let text: String
}

struct PharmacyRow: View {
    let pharmacy: Pharmacy
    let action: (() -> Void)

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pharmacy.name)
                    .font(.headline)
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 15, height: 15)
                    Text("\(pharmacy.reviewCount) ")
                }
                Text("\(pharmacy.rating)")
            }

            Spacer()

            VStack(alignment: .trailing) {
                Button(action: action, label: {
                    Text("Choose")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.init(hex: "503DBB"))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                })
                Text("Delivery \(pharmacy.deliveryTime)")
                Text("Pickup \(pharmacy.pickupTime)")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.white)
    }
}

struct ReviewRow: View {
    let review: Review

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                Text(review.author)
                    .font(.headline)
                    .foregroundStyle(.white)
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                }
            }
            Text(review.text)
                .font(.subheadline)
                .foregroundStyle(.white)
        }
        .padding(.vertical, 4)
    }
}

// Example usage
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
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
    }
}

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages) { page in
                Circle()
                    .fill(page == currentPage ? Color.blue : Color.gray)
                    .frame(width: 8, height: 8)
                    .padding(4)
                    .onTapGesture {
                        currentPage = page
                    }
            }
        }
    }
}
