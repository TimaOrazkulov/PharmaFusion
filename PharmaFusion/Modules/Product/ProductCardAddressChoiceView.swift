//
//  ProductCardAddressChoiceView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 02.06.2024.
//

import SwiftUI

struct ProductCardAddressChoiceView: View {
    
    let closeAction: (() -> Void)
    let deliveryAction: (() -> Void)
    let addressAction: (() -> Void)
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        closeAction()
                    }, label: {
                        Image(systemName: "xmark")
                            .tint(.black)
                    })
                    .padding()
                }
                Image("ketonal") // Replace with actual image name
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            HStack {
                VStack {
                    Text("Delivery")
                        .font(.headline)
                        .padding(.top)
                    Text("03.06 Free")
                        .font(.footnote)
                }
                Spacer()
            }
            HStack {
                Text("Select the address")
                    .font(.subheadline)
                Spacer()
                Button(action: deliveryAction, label: {
                    Text("Choose")
                        .padding(8)
                        .font(.caption)
                })
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(18)
            }
            HStack {
                VStack {
                    Text("By myself")
                        .font(.headline)
                        .padding(.top)
                    Text("03.06 Free")
                        .font(.footnote)
                        .padding(.leading, -12)
                }
                Spacer()
            }
            HStack {
                Text("Timiryazeva 79, Apteka Plus")
                    .font(.subheadline)
                Spacer()
                Button(action: addressAction, label: {
                    Text("Choose")
                        .padding(8)
                        .font(.caption)
                })
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(18)
            }
            .padding(.bottom, 24)
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
    }
}

#Preview {
    ProductCardAddressChoiceView(
        closeAction: {},
        deliveryAction: {},
        addressAction: {}
    )
}
