//
//  ProductView.swift
//  PharmaFusion
//
//  Created by Askar on 01.05.2024.
//

import SwiftUI

struct ProductView: View {
    let productName: String = "Ketonal 100 mg"
    let productDescription: String = "Reduces the amount of secretion, ensures patency of the nasal passages, and introduces nasal breathing. Effectively relieves nasal congestion. The action begins within a few minutes and lasts for several hours."
    let price: String = "$4.8"
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack {
            Image("ketonal") // Replace with actual image name
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Text("You choose")
                    .font(.headline)
                    .padding(.top)
                Spacer()
            }
            
            HStack {
                
                Text(productName)
                    .font(.title)
                    .bold()
                Spacer()
                Text(price)
                    .font(.title2)
                    .bold()
                
            }
            
        Text(productDescription)
            .font(.body)
            .multilineTextAlignment(.leading)
            
            HStack {
                Spacer()
                Stepper(value: $quantity, in: 1...10) {
                    Text("\(quantity)")
                        .font(.headline)
                }
            }
            .padding(.horizontal)
            
            HStack {
                Button("Add to basket") {
                    // Add to basket action
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Buy") {
                    // Buy action
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
