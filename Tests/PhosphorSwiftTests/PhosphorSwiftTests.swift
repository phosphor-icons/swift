import XCTest
@testable import PhosphorSwift

final class PhosphorSwiftTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        
        let a = Ph.addressBook.regular
            .resizable()
            .color(.blue)
            .aspectRatio(contentMode: .fit)
        
        debugPrint(a)
    }
}
