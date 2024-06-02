//
//  ProductPaymentView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 02.06.2024.
//

import SwiftUI

struct ProductPaymentView: View {
    
    @State private var cardIsSelected = false
    @State private var cashIsSelected = false
    @State private var cardNumber = ""
    @State private var cardHolder = ""
    @State private var expiry = ""
    @State private var cvv = ""
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Image("calculator")
                    Spacer()
                }
                HStack {
                    Text("Rinoksil 100 ml")
                        .font(.callout)
                    Spacer()
                    Text("2.6$")
                        .font(.title3)
                }
                HStack {
                    Text("Ketonal 100 mg")
                        .font(.callout)
                    Spacer()
                    Text("2.2$")
                        .font(.title3)
                }
                HStack {
                    Text("Delivery")
                        .font(.callout)
                    Spacer()
                    Text("Free")
                        .font(.title3)
                }
                Line()
                   .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                   .frame(height: 1)
                   .padding(.horizontal, 8)
                   .foregroundColor(.gray)
                Text("Total Payment")
                    .font(.title2)
                    .foregroundColor(.init(hex: "#50535C"))
                Text("4.8$")
                    .font(.title)
                Text("Your will have 10$ bonuses for your order")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.init(hex: "#50535C"))
            }
            .padding(24)
            .background(.white)
            .cornerRadius(16)
            .padding()
            
            VStack {
                HStack {
                    Text("Choose the payment method")
                        .font(.title3)
                    Spacer()
                }
                .padding(.leading, -4)
                ProductPaymentCardView(
                    imageName: "creditcard.fill",
                    title: "Card payment",
                    description: "You will get the bonuses",
                    isSelected: $cardIsSelected
                ) {
                    cardIsSelected = true
                    cashIsSelected = false
                }
                .padding(-4)
                .padding(.bottom, 8)
                if cardIsSelected {
                    ProductCardPaymentEnterView(
                        cardHolderName: $cardHolder,
                        cardNumber: $cardNumber,
                        expiry: $expiry,
                        cvv: $cvv
                    )
                }
                ProductPaymentCardView(
                    imageName: "dollarsign.square.fill",
                    title: "Payment by cash",
                    description: "Your order would be reserved",
                    isSelected: $cashIsSelected
                ) {
                    cardIsSelected = false
                    cashIsSelected = true
                }
                .padding(-4)
                .padding(.bottom, 8)
                NavigationLink {
                    ProductCardPaymentInfoView()
                } label: {
                    Text("Pay")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(Color.init(hex: "#543BD6"))
                        .cornerRadius(20)
                }
            }
            .padding(24)
            .background(Color.init(hex: "#CBE1FD").opacity(0.7))
            .cornerRadius(16)
            .padding()
        }
        .background(Color.init(hex: "#543BD6").opacity(0.78))
        .navigationTitle("Order")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ProductPaymentView()
}
