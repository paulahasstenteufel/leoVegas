//
//  FontsTests.swift
//  ios_calculatorTests
//
//  Created by Paula Hasstenteufel Denz on 09/10/23.
//

import XCTest
@testable import ios_calculator

class FontsTests: XCTestCase {
    
    func testFontsAvailability() {
        let fonts = [
            "Roboto-Bold",
            "Roboto-Medium",
            "Roboto-Regular",
            "Roboto-Light",
            "Roboto-Mono",
            "Roboto-Thin"
        ]
        
        fonts.forEach { font in
            let value = UIFont(name: font, size: 12)
            XCTAssertNotNil(value, "Font \(font) should be available.")
        }
    }
}

