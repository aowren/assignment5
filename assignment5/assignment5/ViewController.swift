//
//  ViewController.swift
//  assignment5
//
//  Created by user241078 on 6/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var euroSwitch: UISwitch!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var poundSwitch: UISwitch!
    @IBOutlet weak var yenSwitch: UISwitch!
    @IBOutlet weak var audSwitch: UISwitch!
    let currencyConverter = CurrencyConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        //errorLabel.isHidden = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConvertedViewController {
            var selectedCurrencies: [Currency] = []
            
            if euroSwitch.isOn {
                selectedCurrencies.append(currencyConverter.currencies[0])
            }
            if poundSwitch.isOn {
                selectedCurrencies.append(currencyConverter.currencies[1])
            }
            if yenSwitch.isOn {
                selectedCurrencies.append(currencyConverter.currencies[2])
            }
            if audSwitch.isOn {
                selectedCurrencies.append(currencyConverter.currencies[3])
            }
            
            destination.selectedCurrencies = selectedCurrencies
            
            if let amountText = amountTextField.text, let amount = Int(amountText) {
                destination.amountInUSD = amount
            } else {
                destination.amountInUSD = 0
            }
        }
    }


    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountText = amountTextField.text, let amount = Int(amountText) else {
            showError(message: "Invalid amount")
            return
        }
        
        if amount <= 0 {
            showError(message: "Amount must be greater than zero")
            return
        }
        
        errorLabel.isHidden = true
        performSegue(withIdentifier: "conversionSegue", sender: self)
    }
    
    private func showError(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
}
