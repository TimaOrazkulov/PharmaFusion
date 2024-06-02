//
//  Basket.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import Foundation

struct Basket: Identifiable {
    let id = UUID()

    let category: String
    let name: String
    let price: String
}
