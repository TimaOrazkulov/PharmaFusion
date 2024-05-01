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
                        .font(.title2)
                    Text("Track your pills and recovery in real time")
                        .font(.system(size: 16))
                }
                .padding(.leading, 8)
                Image(.step1)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 8)
            }
            .padding()
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    AdCardView()
}
