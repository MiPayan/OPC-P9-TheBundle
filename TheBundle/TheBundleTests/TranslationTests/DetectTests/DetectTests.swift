//
//  DetectTests.swift
//  TheBundleTests
//
//  Created by Mickael PAYAN on 01/07/2021.
//

import XCTest
@testable import TheBundle

class DetectTests: XCTestCase {
    func testDetectJsonMapping() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Detect", withExtension: "json") else {
            XCTFail("Missing file: Detect.json")
            return
        }

        let json = try Data(contentsOf: url)
        let detection = try JSONDecoder().decode(DetectionLanguage.self, from: json)
        guard let detectedLanguage = detection.data.detections.first?.first?.language else { return }
            XCTAssertEqual(detectedLanguage, "es")
    }
}
