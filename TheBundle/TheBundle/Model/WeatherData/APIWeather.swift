//
//  Weather.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 03/05/2021.
//
// swiftlint:disable identifier_name

import Foundation

struct APIWeather: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
    let id: Int
}

struct Weather: Decodable {
    let description: String
}
