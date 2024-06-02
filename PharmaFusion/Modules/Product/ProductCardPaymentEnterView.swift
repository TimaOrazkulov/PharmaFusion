//
//  ProductCardPaymentEnterView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 02.06.2024.
//

import SwiftUI

struct ProductCardPaymentEnterView: View {
    @Binding var cardHolderName: String
    @Binding var cardNumber: String
    @Binding var expiry: String
    @Binding var cvv: String
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Cardholder’s Name")
                        .foregroundColor(.init(hex: "#1A202C"))
                        .font(.footnote)
                    Spacer()
                }
                TextField("Cardholder’s Name", text: $cardHolderName)
                    .frame(height: 40)
                    .padding(8)
                    .background(.white)
                    .cornerRadius(12)
                    .font(.subheadline)
            }
            VStack {
                HStack {
                    Text("Card number")
                        .foregroundColor(.init(hex: "#1A202C"))
                        .font(.footnote)
                    Spacer()
                }
                TextField("Card number", text: $cardNumber)
                    .frame(height: 40)
                    .padding(8)
                    .background(.white)
                    .cornerRadius(12)
                    .font(.subheadline)
            }
            HStack {
                VStack {
                    HStack {
                        Text("Expiry date")
                            .foregroundColor(.init(hex: "#1A202C"))
                            .font(.footnote)
                        Spacer()
                    }
                    TextField("Expiry date", text: $expiry)
                        .frame(height: 40)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(12)
                        .font(.subheadline)
                }
                Spacer()
                VStack {
                    HStack {
                        Text("CVV")
                            .foregroundColor(.init(hex: "#1A202C"))
                            .font(.footnote)
                        Spacer()
                    }
                    SecureField("CVV", text: $cvv)
                        .frame(height: 40)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(12)
                        .font(.subheadline)
                }
            }
        }
        .padding()
    }
}

#Preview {
    @State var name = ""
    @State var cardNumber = ""
    @State var expiry = ""
    @State var cvv = ""
    return ProductCardPaymentEnterView(cardHolderName: $name, cardNumber: $cardNumber, expiry: $expiry, cvv: $cvv)
}
