import Foundation

public struct Money: Codable {
    public let amount: Decimal
    
    public init(amount: Decimal) {
        self.amount = amount
    }
}

extension Money {
    public init(from string: String) {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = NumberFormatter.Style.decimal
        if let formattedNumber = formatter.number(from: string) as? NSDecimalNumber  {
            amount = formattedNumber as Decimal
        } else {
            amount = 0.0
        }
    }

    public func string(precision: Int = 2) -> String {
        "\(amount.string(precision: precision)) EUR"
    }
    
    public func isNegative() -> Bool {
        amount.isNegative()
    }
}

extension Money: AdditiveArithmetic {
    public static var zero: Money {
        Money(amount: 0.0)
    }
    
    public static func +(lhs: Money, rhs: Money) -> Money {
        Money(amount: lhs.amount + rhs.amount)
    }

    public static func - (lhs: Money, rhs: Money) -> Money {
        Money(amount: lhs.amount - rhs.amount)
    }
    
    public static func * (lhs: Money, rhs: Decimal) -> Money {
        Money(amount: lhs.amount * rhs)
    }

    public static func * (lhs: Decimal, rhs: Money) -> Money {
        Money(amount: lhs * rhs.amount)
    }
}

extension Decimal {
    public init(from string: String) {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = NumberFormatter.Style.decimal
        if let formattedNumber = formatter.number(from: string) as? NSDecimalNumber  {
            self = formattedNumber as Decimal
        } else {
            self = 0.0
        }
    }
    
    public func string(precision: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = precision
        formatter.maximumFractionDigits = precision
        
        if let string = formatter.string(for: self) {
            return "\(string)"
        }
        return "n/a"
    }
    
    public func isNegative() -> Bool {
        self < 0.0
    }
}

extension Array where Self.Element == Decimal {
    public var normalized: [Element] {
        if let maxElement = self.max(),
           let minElement = self.min() {
            let normalizedElements = self.map { ($0 - minElement) / ( maxElement - minElement)  }
            return normalizedElements
        }
        return self
    }
}
