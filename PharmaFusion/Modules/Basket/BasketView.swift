//
//  OrderCardView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import SwiftUI

struct BasketView: View {
    
    @State private var baskets: [Basket] = Array(
        repeating: Basket(
            category: "Health category",
            name: "Rinoksil 10 ml",
            price: "14.8$"
        ),
        count: 7
    )
    
    var body: some View {
        ZStack {
            List {
                ForEach(baskets) { basket in
                    BasketCardView(
                        basket: basket,
                        deleteAction: {
                            deleteBasket(basket)
                        },
                        buyAction: {
                            
                        }
                    )
                    .listRowBackground(Color.clear)
                    .listRowInsets(
                        EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)
                    )
                }.onDelete(perform: deleteBasket)
            }
            .scrollContentBackground(.hidden)
        }
        .background(Color.init(hex: "503DBB"))
        .navigationTitle("Basket")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func deleteBasket(_ basket: Basket) {
        if let index = baskets.firstIndex(where: { $0.id == basket.id }) {
            baskets.remove(at: index)
        }
    }

    func deleteBasket(at offsets: IndexSet) {
        baskets.remove(atOffsets: offsets)
    }
}

#Preview {
    BasketView()
}
