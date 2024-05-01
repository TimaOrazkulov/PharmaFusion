//
//  ProfileView.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // 1. Profile Image
            Image(systemName: "person.crop.circle") // Replace with your image
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.top, 32) // Adjust spacing as needed
            
            // 2. Name and Surname
            Text("Temirlan Orazkulov")
                .font(.title2)
                .foregroundStyle(.white)
                .bold()
                .padding(.top, 12)
            
            // 3. Phone
            Text("+7 (747) 205-54-04")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 4)
            
            // 4. List with Options
            VStack(spacing: 0) {
                NavigationLink(destination: OrdersView()) {
                    HStack {
                        Label("Orders", systemImage: "bag")
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(Color.init(hex: "A69EDD"))
                }
                
                // Separator Line
                Divider()
                    .padding(.leading)
                
                NavigationLink(destination: BasketView()) {
                    HStack {
                        Label("Basket", systemImage: "cart")
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(Color.init(hex: "A69EDD"))
                }
                
                // Separator Line
                Divider()
                    .padding(.leading)
                
                NavigationLink(destination: DocumentsView()) {
                    HStack {
                        Label("Documents", systemImage: "doc")
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(Color.init(hex: "A69EDD"))
                }
            }
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.top, 24) // Adjust spacing as needed
            Spacer()
        }
        .background(Color.init(hex: "503DBB"))
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

#Preview {
    ProfileView()
}
