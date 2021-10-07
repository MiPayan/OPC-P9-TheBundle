//
//  Detections.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 14/06/2021.
//

import Foundation

struct Detections: Decodable {
    let isReliable: Bool
    let confidence: Double
    let language: String
}
