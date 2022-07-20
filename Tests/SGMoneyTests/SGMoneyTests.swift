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
        let money = Money(amount: 17.42)
        XCTAssertEqual(money.string(), "17.42 EUR")
    }
    
    func testIsNegative() throws {
        let money = Money(amount: -17.42)
        XCTAssertTrue(money.isNegative())
    }
    
    func testAdd() throws {
        let four = Money(amount: 4.0)
        let five = Money(amount: 5.0)
        let nine = Money(amount: 9.0)
        XCTAssertEqual(nine, four + five)
    }

    func testSub() throws {
        let four = Money(amount: 4.0)
        let five = Money(amount: 5.0)
        let nine = Money(amount: 9.0)
        XCTAssertEqual(four, nine - five)
    }
    
    func testMultiply() throws {
        let four = Money(amount: 4.0)
        let eight = Money(amount: 8.0)
        XCTAssertEqual(eight, four * 2)
        XCTAssertEqual(eight, 2 * four)
    }
}
