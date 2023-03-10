//
//  MenuItem.swift
//  little_lemon
//
//  Created by Trần Lê Hoàng Lâm on 10/03/2023.
//

import Foundation

enum Categories: String, CaseIterable {
    case starters = "Starters"
    case mains = "Mains"
    case specials = "Specials"
    case desserts = "Desserts"
    case lunch = "Lunch"
    case drinks = "Drinks"
}

struct MenuItem: Decodable {
    let title: String
    let imgUrl: String
    let price: String
    let category: String
    let decriptionDish: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case imgUrl = "image"
        case price
        case category
        case decriptionDish = "description"
    }
}
