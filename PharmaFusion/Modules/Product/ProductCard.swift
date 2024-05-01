//
//  ProductCard.swift
//  PharmaFusion
//
//  Created by Askar on 01.05.2024.
//

import Foundation

struct ProductCard: Hashable {
    let productName: String
    let price: String
    let manufacturer: String
    let dosage: String
    let description: String
    let pharmacies: [Pharmacy]
    let reviews: [Review]
}
