//
//  ViewModelTests.swift
//  ios_calculatorTests
//
//  Created by Paula Hasstenteufel Denz on 08/10/23.
//

import XCTest
@testable import ios_calculator

class CalculatorViewModelTests: XCTestCase {
    let viewModel = CalculatorViewModel()
    
    func testAddition() {
        viewModel.perform(operation: .add, operand1: 7, operand2: 4)
        XCTAssertEqual(viewModel.result, 11)
        
        viewModel.perform(operation: .add, operand1: 4, operand2: 7)
        XCTAssertEqual(viewModel.result, 11)
    }
    
    func testSubtraction() {
        viewModel.perform(operation: .subtract, operand1: 7, operand2: 4)
        XCTAssertEqual(viewModel.result, 3)
        
        viewModel.perform(operation: .subtract, operand1: 4, operand2: 7)
        XCTAssertEqual(viewModel.result, -3)
    }
    
    func testDivision() {
        viewModel.perform(operation: .divide, operand1: 7, operand2: 4)
        XCTAssertEqual(viewModel.result, 1.75)
    }
    
    func testMultiplication() {
        viewModel.perform(operation: .multiply, operand1: 7, operand2: 4)
        XCTAssertEqual(viewModel.result, 28)
    }
    
    func testSin() {
//        viewModel.perform(operation: .sin, operand1: 7, operand2: 4)
//        XCTAssertEqual(viewModel.result, 11)
    }
    
    func testCos() {
//        viewModel.perform(operation: .cos, operand1: 7, operand2: 4)
//        XCTAssertEqual(viewModel.result, 11)
    }
}
