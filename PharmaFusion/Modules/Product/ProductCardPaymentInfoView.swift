//
//  ProductCardPaymentInfoView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 02.06.2024.
//

import SwiftUI

struct ProductCardPaymentInfoView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Image("successPayment")
                    Spacer()
                }
                Text("Thank you, the purchase was successful!")
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("Track your order on the delivery page in your personal account")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Button("Continue") {
                    
                }
                .font(.headline)
                .padding(.vertical, 8)
                .padding(.horizontal, 40)
                .background(Color.init(hex: "#543BD6"))
                .foregroundColor(.white)
                .cornerRadius(16)
            }
            .padding()
            .background(.white.opacity(0.25))
            .cornerRadius(20)
            .padding(16)
            Spacer()
        }
        .navigationTitle("Order")
        .navigationBarTitleDisplayMode(.large)
        .background(Color.init(hex: "#543BD6"))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProductCardPaymentInfoView()
}
