import UIKit

class ConvertedViewController: UIViewController {
    
    @IBOutlet weak var currencyStackView: UIStackView!
    @IBOutlet weak var conversionLabel: UILabel!
    var selectedCurrencies: [Currency] = []
    var amountInUSD: Int = 0 {
        didSet {
            convertAmount()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        convertAmount()
    }

    
    @IBOutlet weak var currencyLabel: UILabel!
    
        let currencyConverter = CurrencyConverter()
    
    private func convertAmount() {
        guard let stackView = currencyStackView else {
            return
        }

        stackView.subviews.forEach { $0.removeFromSuperview() }

        let amountLabel = UILabel()
        amountLabel.text = "Amount in USD: \(amountInUSD)"
        amountLabel.font = UIFont.systemFont(ofSize: 17)

        stackView.addArrangedSubview(amountLabel)

        for currency in selectedCurrencies {
            let convertedAmount = currencyConverter.convert(amount: amountInUSD, to: currency)

            let currencyLabel = UILabel()
            currencyLabel.text = "\(currency.name): \(convertedAmount)"
            currencyLabel.font = UIFont.systemFont(ofSize: 17)

            stackView.addArrangedSubview(currencyLabel)
        }
    }




}
