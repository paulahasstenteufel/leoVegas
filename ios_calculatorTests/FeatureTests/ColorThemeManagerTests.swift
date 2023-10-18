//
//  ColorThemeManagerTests.swift
//  ios_calculatorTests
//
//  Created by Paula Hasstenteufel Denz on 08/10/23.
//

import XCTest
@testable import ios_calculator

class ThemeManagerTests: XCTestCase {
    
    var themeManager: ThemeManager!

    override func setUp() {
        super.setUp()
        themeManager = ThemeManager()
    }
    
    func testInitialState() {
        XCTAssertEqual(themeManager.currentTheme, .cold, "Initial theme should be Cold")
        XCTAssertTrue(themeManager.isCold, "Initial state of flag 'isCold' should be true")
    }

    func testThemeSwitching() {
        themeManager.toggleTheme()
        XCTAssertEqual(themeManager.currentTheme, .warm, "Theme should have changed from Cold to Warm.")

        themeManager.toggleTheme()
        XCTAssertEqual(themeManager.currentTheme, .cold, "Theme should have changed from Warm back to Cold.")
    }
    
    override func tearDown() {
        themeManager = nil
        super.tearDown()
    }
}
