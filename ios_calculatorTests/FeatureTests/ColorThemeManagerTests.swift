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
        XCTAssertFalse(themeManager.isWarm, "Initial state of flag 'isWarm' should be false")
    }

    func testThemeSwitching() {
        themeManager.isWarm.toggle()
        XCTAssertEqual(themeManager.currentTheme, .warm, "Theme should have changed from Cold to Warm.")

        themeManager.isWarm.toggle()
        XCTAssertEqual(themeManager.currentTheme, .cold, "Theme should have changed from Warm back to Cold.")
    }
    
    override func tearDown() {
        themeManager = nil
        super.tearDown()
    }
}
