//
//  DocumentsView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import SwiftUI

struct DocumentsView: View {
    var body: some View {
        List {
            // Section 1: Rules
            Section(header: Text("Rules of our Web Service")) {
                DocumentView(title: "Terms & Conditions", downloadAction: {
                    // Handle download action for Terms & Conditions
                })
            }
            .listRowBackground(Color.clear)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.white)
            
            // Section 2: License to Sell
            Section(header: Text("License to Sell")) {
                DocumentView(title: "Seller Agreement", downloadAction: {
                    // Handle download action for Seller Agreement
                })
            }
            .listRowBackground(Color.clear)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.white)
            
            // Section 3: Documents about Products
            Section(header: Text("Documents about Products")) {
                DocumentView(title: "Product Specifications", downloadAction: {
                    // Handle download action for Product Specifications
                })
                DocumentView(title: "Safety Information", downloadAction: {
                    // Handle download action for Safety Information
                })
            }
            .listRowBackground(Color.clear)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.white)
        }
        .listRowInsets(EdgeInsets())
        .scrollContentBackground(.hidden)
        .listRowSeparator(.hidden)
        .padding(.vertical, 16)
        .background(Color.init(hex: "503DBB"))
        .navigationTitle("Documents")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DocumentsView()
}
