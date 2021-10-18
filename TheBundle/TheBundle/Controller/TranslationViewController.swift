//
//  TranslationViewController.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 07/05/2021.
//

import UIKit

final class TranslationViewController: UIViewController {

    @IBOutlet private weak var autoDetectedLanguageLabel: UILabel!
    @IBOutlet private weak var randomLanguageTextView: UITextField!
    @IBOutlet private weak var englishTextView: UITextField!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    private let translationService = TranslationService()
    private let detectionService = DetectionService()

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        activityIndicator.hidesWhenStopped = true
    }
}

private extension TranslationViewController {
    //    to get the translation using the network call
    func getTranslation(text: String) {
        translationService.getTranslation(text: text) { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                switch result {
                case .success(let translation):
                    guard let translate = translation.data.translations.first?.translatedText else {
                        return
                    }
                    self.englishTextView.text = translate
                case .failure(let apiError):
                    self.alertPopUp()
                    print(apiError)
                }
            }
        }
    }

    //    for automatic detection using the network call
    func getDetection(text: String) {
        detectionService.getDetection(text: text) { [weak self] result in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                case .success(let detection):
                    guard let languageDetected = detection.data.detections.first?.first?.language else { return }
                    self.autoDetectedLanguageLabel.text = "Détecter la langue : \(languageDetected.uppercased())"
                case .failure(let apiError):
                    self.alertPopUp()
                    print(apiError)
                }
            }
        }
    }

    //    to get translation when button tapped
    @IBAction func didTapTranslationButton(_ sender: Any) {
        dismissKeyboard()
        activityIndicator.startAnimating()
        guard let randomLanguageTextView = randomLanguageTextView.text else { return }
            getDetection(text: randomLanguageTextView)
            getTranslation(text: randomLanguageTextView)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
