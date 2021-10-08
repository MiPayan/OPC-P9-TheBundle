//
//  Double+File.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 24/05/2021.
//

import Foundation

private let numberFormatter = NumberFormatter()

//    to delete numbers after the comma
extension Double {
    func toTruncatedString() -> String {
        let number = NSNumber(value: self)
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0
        return String(numberFormatter.string(from: number) ?? "\(self)")
    }

    func toTruncatedStringWithTwoDigits() -> String {
        let number = NSNumber(value: self)
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return String(numberFormatter.string(from: number) ?? "\(self)")
    }
}
