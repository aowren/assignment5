struct Currency {
    let name: String
    let rate: Double
}

class CurrencyConverter {
    let currencies: [Currency] = [
        Currency(name: "EUR", rate: 0.85),
        Currency(name: "GBP", rate: 0.74),
        Currency(name: "JPY", rate: 109.48),
        Currency(name: "AUD", rate: 1.36)
    ]
    
    func convert(amount: Int, to currency: Currency) -> Double {
        return Double(amount) * currency.rate
    }
}
