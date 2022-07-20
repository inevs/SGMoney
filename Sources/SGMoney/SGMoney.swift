import Foundation

enum Currency: String, Codable {
    case eur = "EUR"
    case usd = "USD"
}
public struct Money {
    let amount: Decimal
    let currency: Currency
    
    init(amount: Decimal, currency: Currency = .eur) {
        self.amount = amount
        self.currency = currency
    }
}

extension Money {
    init(from string: String) {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        if let formattedNumber = formatter.number(from: string) as? NSDecimalNumber {
            amount = formattedNumber as Decimal
        } else {
            amount = 0.0
        }
        self.currency = .eur
    }
    
    func string(precision: Int = 2) -> String {
            "\(amount.string(precision: precision)) \(currency.rawValue)"
        }
        
    func isNegative() -> Bool {
            amount.isNegative()
    }
}

extension Decimal {
    init(from string: String) {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = NumberFormatter.Style.decimal
        if let formattedNumber = formatter.number(from: string) as? NSDecimalNumber  {
            self = formattedNumber as Decimal
        } else {
            self = 0.0
        }
    }
    
    func string(precision: Int = 2) -> String {
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
    
    func isNegative() -> Bool {
        self < 0.0
    }
}

//extension Array where Self.Element == Decimal {
//    var normalized: [Element] {
//        if let maxElement = self.max(),
//           let minElement = self.min() {
//            let normalizedElements = self.map { ($0 - minElement) / ( maxElement - minElement)  }
//            return normalizedElements
//        }
//        return self
//    }
//}
