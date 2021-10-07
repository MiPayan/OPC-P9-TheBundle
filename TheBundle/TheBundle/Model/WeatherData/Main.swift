//
//  Main.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 24/05/2021.
//

import Foundation

struct Main: Decodable {
    let temp: Double
    let tempMin: Double
    let tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
