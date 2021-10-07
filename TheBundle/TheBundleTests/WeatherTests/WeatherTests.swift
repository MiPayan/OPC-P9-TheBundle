//
//  WeatherTests.swift
//  TheBundleTests
//
//  Created by Mickael PAYAN on 01/07/2021.
//

import XCTest
@testable import TheBundle

final class WeatherTests: XCTestCase {
    func testWeatherJsonMapping() throws {
        // Given
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Weather", withExtension: "json") else {
            XCTFail("Missing file: Weather.json")
            return
        }

        // When
        let json = try Data(contentsOf: url)
        let weather = try JSONDecoder().decode(APIWeather.self, from: json)

        // Then
        if let description = weather.weather.first?.description {
            XCTAssertEqual(description, "clear sky")
        }
        XCTAssertEqual(weather.name, "Bronx County")
        XCTAssertEqual(weather.id, 5110253)
        XCTAssertEqual(weather.main.temp, 296.54)
        XCTAssertEqual(weather.main.tempMin, 294.38)
        XCTAssertEqual(weather.main.tempMax, 298.07)
    }
}
