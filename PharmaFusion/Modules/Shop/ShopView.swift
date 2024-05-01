//
//  ShopView.swift
//  PharmaFusion
//
//  Created by Askar on 01.05.2024.
//

import SwiftUI

struct ShopView: View {
    @State var searchText: String = ""
    let items = [SmallItemView(), SmallItemView(), SmallItemView(), SmallItemView(), SmallItemView(), SmallItemView()]
    let typoItems = ["Allergy", "Heart", "Liver", "Brain", "Smash", "Bob"]
    let filterItems = ["Filters", "Sorting"]
    
    @State private var isShowingBottomSheet = false
    @State private var selectedOption: String? = nil
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    TextField("Search something...", text: $searchText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    CollectionView(items: typoItems)
                        .padding(.leading, 16)
                    HStack {
                        Text("List of products")
                            .padding(.leading, 16)
                            .padding([.vertical], 4)
                        Spacer()
                    }
                    CollectionView(items: filterItems)
                        .padding(.leading, 16)
                        .bottomSheet(isPresented: $isShowingBottomSheet) {
                            VStack(spacing: 16) {
                                Button("Option 1") {
                                    selectedOption = "Option 1"
                                    isShowingBottomSheet = false
                                }
                                Button("Option 2") {
                                    selectedOption = "Option 2"
                                    isShowingBottomSheet = false
                                }
                                Button("Cancel") {
                                    isShowingBottomSheet = false
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                        }
//                        .overlay(
//                            Text("Selected option: \(selectedOption ?? "None")")
//                                .padding()
//                                .background(Color.gray)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                                .padding()
//                                .opacity(selectedOption == nil ? 0 : 1)
//                                .animation(.default)
//                            , alignment: .bottom
//                        )
//                        .onTapGesture {
//                            isShowingBottomSheet = true
//                        }
                    
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
    ShopView()
}

extension View {
    func bottomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        modifier(BottomSheet(isPresented: isPresented, content: content))
    }
}

struct BottomSheet<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let content: () -> SheetContent
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                VStack {
                    Spacer()
                    Group { // Wrap content in Group
                        self.content()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 5)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}
