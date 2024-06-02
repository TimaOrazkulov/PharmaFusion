//
//  BottomSheet.swift
//  PharmaFusion
//
//  Created by Askar on 01.05.2024.
//

import SwiftUI

struct BottomSheet<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let content: () -> SheetContent
    @State private var sheetHeight: CGFloat = .zero
    @State private var offset: CGFloat = 0
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                VStack {
                    Spacer()
                    Group {
                        self.content()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.bottom, 56)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 5)
                }
                .offset(y: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation.height
                        }
                        .onEnded { value in
                            // Close the sheet if dragged below a certain threshold
                            if value.translation.height < -50 {
                                isPresented = false
                            } else {
                                offset = 0
                            }
                        }
                )
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct InnerHeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
