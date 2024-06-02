//
//  Order.swift
//  PharmaFusion
//
//  Created by Temirlan Orazkulov on 01.05.2024.
//

import Foundation

struct Order: Hashable {
    let orderNumber: Int
    let productName: String
    let price: String
    let orderDate: String
    let deliveryAddress: String
}
