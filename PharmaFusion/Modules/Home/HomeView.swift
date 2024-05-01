//
//  HomeView.swift
//  PharmaFusion
//
//  Created by Askar on 30.04.2024.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    let items = [SmallItemView(), SmallItemView(), SmallItemView(), SmallItemView(), SmallItemView(), SmallItemView()]
//    let items = (0..<100).map { "Item \($0)" }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    TextField("Search something...", text: $searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    AdCardView()
                    AdCardView()
                    HStack {
                        Text("TOP products 2023")
                        Spacer()
                    }
                    
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(0..<items.count / 2 + items.count % 2, id: \.self) { row in
                            HStack(spacing: 16) {
                                ForEach(0..<2) { column in
                                    let index = column + row * 2
                                    items[index]
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

#Preview {
    HomeView()
}
