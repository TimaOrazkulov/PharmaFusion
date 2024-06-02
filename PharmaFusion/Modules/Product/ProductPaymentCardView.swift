//
//  ProductPaymentCardView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 02.06.2024.
//

import SwiftUI

struct ProductPaymentCardView: View {
    let imageName: String
    let title: String
    let description: String
    @Binding var isSelected: Bool
    let tapAction: (() -> Void)
    
    var body: some View {
        HStack {
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.green)
                    .padding(.leading, 16)
            } else {
                Circle()
                    .fill(.clear)
                    .frame(width: 24, height: 24)
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.leading, 16)
            }
            Image(systemName: imageName)
                .resizable()
                .frame(width: 24, height: 20)
                .padding(.leading, 8)
                .foregroundColor(.init(hex: "#543BD6"))
            VStack {
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Text(description)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            .padding(.vertical, 16)
            .padding(.leading, 12)
            .padding(.trailing, 16)
        }
        .gesture(
            TapGesture()
                .onEnded({ _ in
                    tapAction()
                })
        )
        .background(.white)
        .cornerRadius(12)
    }
}

#Preview {
    @State var bool = false
    return ProductPaymentCardView(imageName: "creditcard.fill", title: "Card payment", description: "You will get the bonuses", isSelected: $bool, tapAction: {})
}
