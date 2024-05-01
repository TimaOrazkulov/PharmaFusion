//
//  CollectionView.swift
//  PharmaFusion
//
//  Created by Askar on 01.05.2024.
//

import SwiftUI

struct CollectionView: View {
    @State var items: [String]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .frame(height: 32)
                            .padding(.horizontal, 16)
                            .background(Color.blue)
                            .cornerRadius(16)
                    }
                }
            }
        }
    }
}

#Preview {
    CollectionView(items: ["Allergy", "Heart", "Liver", "Brain", "Smash", "Left", "Right"])
}
