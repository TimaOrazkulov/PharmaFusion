//
//  OrderCardView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import SwiftUI

struct BasketCardView: View {
    let basket: Basket
    let deleteAction: (() -> Void)
    let buyAction: (() -> Void)
    
    var body: some View {
        ZStack {
            HStack {
                Image(.rinoksil)
                VStack(alignment: .leading, spacing: 0) {
                    Text(basket.name)
                        .foregroundStyle(Color.init(hex: "543BD6"))
                        .font(.system(size: 14, weight: .regular))
                        .padding(.top, 8)
                    Text(basket.name)
                        .foregroundStyle(Color.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.top, 8)
                    Text(basket.price)
                        .foregroundStyle(Color.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.top, 8)
                    HStack {
                        Button(action: deleteAction) {
                            Text("Delete")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color.init(hex: "543BD6"))
                                .frame(height: 32)
                                .padding()
                                .cornerRadius(15)
                        }
                        Button(action: buyAction) {
                            Text("Buy")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .frame(width: 100, height: 32)
                                .background(Color.init(hex: "543BD6"))
                                .cornerRadius(16)
                        }
                    }
                }
                Spacer()
            }
            .padding(16)
        }
        .background(Color.init(hex: "CAC5EB"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    BasketCardView(
        basket: Basket(
            category: "Health category",
            name: "Rinoksil 10 ml",
            price: "14.8$"
        ),
        deleteAction: {},
        buyAction: {}
    )
}
