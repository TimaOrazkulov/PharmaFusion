//
//  AdCardView.swift
//  PharmaFusion
//
//  Created by Askar on 30.04.2024.
//

import SwiftUI

struct AdCardView: View {
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Track your pills and recovery in real time")
                        .font(.system(size: 20, weight: .medium))
                    Text("Track your pills and recovery in real time")
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.leading, 8)
                Image(.step1)
                    .resizable()
                    .frame(width: 120, height: 100)
                    .padding(.trailing, 8)
            }
            .padding()
        }
        .background(Color.init(hex: "CAC5EB"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    AdCardView()
}
