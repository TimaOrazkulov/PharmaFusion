//
//  DocumentView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import SwiftUI

struct DocumentView: View {
    let title: String
    let downloadAction: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "doc.fill")
                .renderingMode(.template)
                .foregroundStyle(.purple)
                .padding(.leading, 16)
            Text(title)
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Button(action: downloadAction) {
                Image(systemName: "arrow.down.circle")
            }
            .padding(.trailing, 16)
        }
        .padding(.vertical, 20)
        .background(Color.init(hex: "CAC5EB"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    DocumentView(title: "Rules", downloadAction: {})
}
