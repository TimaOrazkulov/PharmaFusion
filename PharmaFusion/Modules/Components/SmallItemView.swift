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
                .frame(width: 80, height: 90)
                .padding(.trailing, 8)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading) {
                Text("Rinoksil, 10 ml")
                Text("2000 tg")
                Text("1 spoon after breakfast")
                    .font(.system(size: 14, weight: .light))
            }
            .padding(8)
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SmallItemView()
}
