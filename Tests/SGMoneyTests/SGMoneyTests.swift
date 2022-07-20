import XCTest
@testable import SGMoney

final class SGMoneyTests: XCTestCase {

    func testFromString() throws {
        let money = Money(from: "17.42")
        let actual = NSDecimalNumber(decimal: money.amount).doubleValue
        let expected: Double =  17.42
        XCTAssertEqual(actual, expected, accuracy: 0.1)
    }
    
    func testToString() throws {
        let money = Money(amount: 17.42, currency: .eur)
        XCTAssertEqual(money.string(), "17.42 EUR")
    }
    
    func testIsNegative() throws {
        let money = Money(amount: -17.42, currency: .eur)
        XCTAssertTrue(money.isNegative())
    }
}
