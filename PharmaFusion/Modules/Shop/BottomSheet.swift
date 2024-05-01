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
