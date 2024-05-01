//
//  ProductCardView.swift
//  PharmaFusion
//
//  Created by Askar on 01.05.2024.
//

import SwiftUI

struct ProductCardView: View {
    let productName: String
    let price: String
    let manufacturer: String
    let dosage: String
    let description: String
    let pharmacies: [Pharmacy]
    let reviews: [Review]
    @State private var currentPage = 0

    var body: some View {
        ScrollView{
            VStack {
                // Product Image
                HStack {
                    Text("Product Card")
                        .underline()
                        .font(.system(size: 30))
                    Spacer()
                }
                VStack {
                    TabView(selection: $currentPage) {
                        Image("ketonal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(0)
                        Image("ketonal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(1)
                        Image("ketonal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle())
                    
                    // Page control
                    PageControl(numberOfPages: 3, currentPage: $currentPage)
                        .padding(.vertical)
                }
                
                

                // Product Details
                VStack(alignment: .leading) {
                    Text(productName)
                        .font(.title)
                        .bold()

                    HStack {
                        Text("From:")
                            .font(.headline)
                        Text(price)
                            .font(.headline)
                            .foregroundColor(.blue)
                    }

                    HStack {
                        Text("Dosage:")
                            .font(.headline)
                        Text(dosage)
                            .font(.headline)
                    }

                    HStack {
                        Text("Manufacturer:")
                            .font(.headline)
                        Text(manufacturer)
                            .font(.headline)
                    }

                    Text(description)
                        .padding(.top)
                }
                .padding()

                // Pharmacies
                VStack(alignment: .leading) {
                    Text("Pharmacies")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)

                    ForEach(pharmacies, id: \.id) { pharmacy in
                        PharmacyRow(pharmacy: pharmacy)
                    }
                }
                .padding()

                // Reviews
                VStack(alignment: .leading) {
                    Text("Reviews")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)

                    ForEach(reviews, id: \.id) { review in
                        ReviewRow(review: review)
                    }

                    Button("View more") {
                        // Handle action to view more reviews
                    }
                }
                .padding()
            }
            .padding(.leading, 16)
        }
    }
}

struct Pharmacy: Identifiable {
    let id = UUID()
    let name: String
    let rating: Double
    let reviewCount: Int
    let deliveryTime: String
    let pickupTime: String
}

struct Review: Identifiable {
    let id = UUID()
    let author: String
    let text: String
}

struct PharmacyRow: View {
    let pharmacy: Pharmacy

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pharmacy.name)
                    .font(.headline)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(pharmacy.rating) (\(pharmacy.reviewCount) reviews)")
                }
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text("Delivery \(pharmacy.deliveryTime)")
                Text("Pickup \(pharmacy.pickupTime)")
            }
        }
        .padding(.vertical, 8)
    }
}

struct ReviewRow: View {
    let review: Review

    var body: some View {
        VStack(alignment: .leading) {
            Text(review.author)
                .font(.headline)
            Text(review.text)
                .font(.subheadline)
        }
        .padding(.vertical, 4)
    }
}

// Example usage
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(
            productName: "Ketonal 100 mg",
            price: "$4.99",
            manufacturer: "Slovenia",
            dosage: "100mg",
            description: "Reduces the amount of secretion, ensures patency of the nasal passages, and introduces nasal breathing. Effectively relieves nasal congestion.",
            pharmacies: [
                Pharmacy(name: "Sadykhan pharmacy", rating: 4.8, reviewCount: 18, deliveryTime: "20:09", pickupTime: "20:09"),
                Pharmacy(name: "Rauza pharmacy", rating: 6.8, reviewCount: 18, deliveryTime: "20:09", pickupTime: "20:09"),
                Pharmacy(name: "Apteka+ pharmacy", rating: 10.8, reviewCount: 18, deliveryTime: "20:09", pickupTime: "20:09")
            ],
            reviews: [
                Review(author: "Yasmin U.", text: "Amazing spray!! Helped me with my nose problem!"),
                Review(author: "Yasmin U.", text: "Amazing spray!! Helped me with my nose problem!")
            ]
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
