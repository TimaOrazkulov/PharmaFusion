//
//  ProductAddressView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 02.06.2024.
//

import SwiftUI

struct ProductAddressView: View {
    
    @State private var district: String = ""
    @State private var street: String = ""
    @State private var house: String = ""
    @State private var appartment: String = ""
    @State private var comment: String = ""
    
    let addAction: (() -> Void)
    let closeAction: (() -> Void)
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: closeAction, label: {
                    Image(systemName: "xmark")
                        .padding()
                })
                .tint(.black)
                .frame(width: 44, height: 44)
            }
            ZStack {
                Color.init(hex: "543BD6")
                    .opacity(0.45)
                Color.white
                    .opacity(0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(24)
                Image("map")
                    .padding(.vertical, 20)
                    .padding(.horizontal, 4)
            }
            Text("Address Information")
                .font(.headline)
                .padding(.top, 8)
            makeTextField(text: $district, placeholder: "Enter district")
            makeTextField(text: $street, placeholder: "Enter street")
            makeTextField(text: $house, placeholder: "Enter house number")
            makeTextField(text: $appartment, placeholder: "Enter appartment")
            makeTextField(text: $comment, placeholder: "Enter comment")
                .padding(.bottom, 8)
            Button("Add") {
                addAction()
            }
            .padding(.vertical, 8)
            .frame(width: 200)
            .background(Color.init(hex: "543BD6"))
            .foregroundColor(.white)
            .cornerRadius(20)
            .disabled(district.isEmpty || street.isEmpty || house.isEmpty || appartment.isEmpty || comment.isEmpty)
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
    }
    private func makeTextField(
        text: Binding<String>,
        placeholder: String
    ) -> some View {
        TextField(placeholder, text: text)
            .padding(8)
            .background(Color.init(hex: "CCC1FF"))
            .cornerRadius(12)
            .padding(.horizontal, 24)
            .padding(.top, 8)
    }
}

#Preview {
    ProductAddressView(addAction: {}, closeAction: {})
}
