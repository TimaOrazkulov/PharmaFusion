//
//  SmallItemView.swift
//  PharmaFusion
//
//  Created by Askar on 30.04.2024.
//

import SwiftUI

struct SmallItemView: View {
    var body: some View {
        VStack {
            Image(.step1)
                .resizable()
                .frame(width: 100, height: 90)
                .padding([.trailing, .top], 8)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading) {
                Text("Rinoksil, 10 ml")
                    .font(.system(size: 20, weight: .medium))
                Text("2000 tg")
                    .font(.system(size: 16, weight: .semibold))
                Text("1 spoon after breakfast")
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
    SmallItemView()
}
