//
//  OrderCardView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import SwiftUI

struct OrderCardView: View {
    let order: Order
    let deliveryAction: (() -> Void)
    let helpAction: (() -> Void)
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image(.rinoksil)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Order #\(order.orderNumber)")
                        .foregroundStyle(Color.init(hex: "#543BD6"))
                        .font(.system(size: 14, weight: .regular))
                    Text(order.productName)
                        .foregroundStyle(Color.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.top, 8)
                    Text(order.price)
                        .foregroundStyle(Color.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.top, 8)
                    Text(order.orderDate)
                        .foregroundStyle(Color.init(hex: "50535C"))
                        .font(.system(size: 12, weight: .regular))
                        .padding(.top, 8)
                    Text(order.deliveryAddress)
                        .foregroundStyle(Color.black)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.top, 8)
                    HStack {
                        Button(action: deliveryAction) {
                            Text("Help")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color.init(hex: "543BD6"))
                                .frame(height: 32)
                                .padding()
                                .cornerRadius(15)
                        }
                        Button(action: helpAction) {
                            Text("Delivery")
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
    OrderCardView(
        order: Order(
            orderNumber: 12,
            productName: "Rinoksil 10 ml",
            price: "14.8$",
            orderDate: "03.10.2023 15:19",
            deliveryAddress: "Sanatornaya 13A"
        ),
        deliveryAction: {},
        helpAction: {}
    )
}
