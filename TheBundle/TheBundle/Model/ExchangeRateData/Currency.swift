//
//  Exchnage.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 03/05/2021.
//

import Foundation

struct Currency: Decodable {
    let rates: Rates
}

struct Rates: Codable {
    let usd: Double

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
