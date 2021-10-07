//
//  UIViewController+AlertController.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 28/07/2021.
//

import UIKit

extension UIViewController {
    func alertPopUp() {
        let alert = UIAlertController(title: "Erreur",
                                      message: "Désolé, le service est actuellement indisponible.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true)
    }
}
