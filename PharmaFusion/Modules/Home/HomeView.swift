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
    
    init() {
        // Setting up the navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearance.backgroundColor = UIColor.init(hex: "503DBB")
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    TextField("Search something...", text: $searchText)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    AdCardView()
                        .padding(.horizontal, 8)
                    AdCardView()
                        .padding(.horizontal, 8)
                    HStack {
                        Text("TOP products 2023")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.leading, 12)
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
                    .padding(.horizontal, 16)
                }
                .padding(.horizontal, 8)
            }
        }
        .background(Color.init(hex: "503DBB"))
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    HomeView()
}
