//
//  ExchangeRateTests.swift
//  TheBundleTests
//
//  Created by Mickael PAYAN on 01/07/2021.
//

import XCTest
@testable import TheBundle

class ExchangeRateTests: XCTestCase {
    func testExchangeRateJsonMapping() throws {
        // Given
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "ExchangeRate", withExtension: "json") else {
            XCTFail("Missing file: ExchangeRate.json")
            return
        }

        // When
        let json = try Data(contentsOf: url)
        let currency = try JSONDecoder().decode(Currency.self, from: json)

        // Then
        XCTAssertEqual(currency.rates.usd, 1.18501)
    }
}
