import XCTest
@testable import Streamable

final class StreamableTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Streamable().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
