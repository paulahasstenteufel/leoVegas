//
//  ColorThemeManagerTests.swift
//  ios_calculatorTests
//
//  Created by Paula Hasstenteufel Denz on 08/10/23.
//

import XCTest
@testable import ios_calculator

class ThemeManagerTests: XCTestCase {
    func testThemeSwitching() {
        let themeManager = ThemeManager.shared
        let baseTheme = Theme.cold

        themeManager.toggleTheme()
        XCTAssertNotEqual(baseTheme, themeManager.currentTheme, "Base theme should have changed from Cold to Warm.")

        themeManager.toggleTheme()
        XCTAssertEqual(baseTheme, themeManager.currentTheme, "Base theme should have changed from Warm back to Cold.")
    }
    
    override func tearDown() {
        ThemeManager.shared.currentTheme = .cold
    }
}
