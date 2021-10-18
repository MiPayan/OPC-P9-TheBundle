//
//  TranslationTests.swift
//  TheBundleTests
//
//  Created by Mickael PAYAN on 01/07/2021.
//

import XCTest
@testable import TheBundle

class TranslationTests: XCTestCase {
    func testTranslationJsonMapping() throws {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Translation", withExtension: "json") else {
            XCTFail("Missing file: Translation.json")
            return
        }

        let json = try Data(contentsOf: url)
        let translation = try JSONDecoder().decode(Translation.self, from: json)
        guard let translate = translation.data.translations.first?.translatedText  else { return }
            XCTAssertEqual(translate, "Open classroom")
    }
}
