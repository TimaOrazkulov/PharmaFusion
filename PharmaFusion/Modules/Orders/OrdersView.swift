//
//  OrdersView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import SwiftUI

struct OrdersView: View {
    
    private var orders: [Order] = [
        Order(
            orderNumber: 1,
            productName: "Rinoksil 10 ml",
            price: "14.8$",
            orderDate: "03.10.2023 15:19",
            deliveryAddress: "Sanatornaya 13A"
        ),
        Order(
            orderNumber: 2,
            productName: "Rinoksil 10 ml",
            price: "14.8$",
            orderDate: "03.10.2023 15:19",
            deliveryAddress: "Sanatornaya 13A"
        )
    ]
    
    var body: some View {        
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(orders, id: \.self) { order in
                        OrderCardView(
                            order: order,
                            deliveryAction: {
                                
                            },
                            helpAction: {
                                
                            }
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 16)
            .background(Color.init(hex: "503DBB"))
            .navigationTitle("Orders")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OrdersView()
}
