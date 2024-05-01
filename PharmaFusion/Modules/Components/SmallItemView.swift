//
//  SmallItemView.swift
//  PharmaFusion
//
//  Created by Askar on 30.04.2024.
//

import SwiftUI

struct SmallItemView: View {
    
    let item: ItemSmall
    
    var body: some View {
        VStack {
            Image(.step1)
                .resizable()
                .frame(width: 100, height: 90)
                .padding([.trailing, .top], 8)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.system(size: 20, weight: .medium))
                Text(item.price)
                    .font(.system(size: 16, weight: .semibold))
                Text(item.description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.init(hex: "5C5D6C"))
            }
            .padding(8)
        }
        .background(Color.init(hex: "A69EDD"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SmallItemView(
        item: ItemSmall(
            title: "Rinoksil, 10 ml",
            price: "2000 tg",
            description: "1 spoon after breakfast"
        )
    )
}
