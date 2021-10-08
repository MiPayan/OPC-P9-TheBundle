//
//  ExchangeRateViewController.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 07/05/2021.
//

import UIKit

final class ExchangeRateViewController: UIViewController {

    @IBOutlet private weak var valueToConvertTextField: UITextField!
    @IBOutlet private weak var valueConvertedTextField: UITextField!
    @IBOutlet private weak var convertButton: ButtonSettings!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    private let exchangeRate = ExchangeRateService()

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        activityIndicator.hidesWhenStopped = true
    }
}

private extension ExchangeRateViewController {
    //    to get the currency using the network call
    func getCurrency(_ value: String) {
        exchangeRate.getCurrency { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                switch result {
                case .success(let currency):
                    if let valueToConvertText = self.valueToConvertTextField.text,
                       let doubleToConvert = Double(valueToConvertText) {
                        let valueToMultiply = Double(currency.rates.usd)
                        let operation = doubleToConvert * valueToMultiply
                        self.valueConvertedTextField.text = String(operation.toTruncatedStringWithTwoDigits())
                    }
                case .failure(let apiError):
                    self.alertPopUp()
                    print(apiError)
                }
            }
        }
    }

    //    to get convertion when button tapped
    @IBAction func didTapConvertButton(_ sender: Any) {
        dismissKeyboard()
        activityIndicator.startAnimating()
        if let valueToConvertText = self.valueToConvertTextField.text {
            getCurrency(valueToConvertText)
        }
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
