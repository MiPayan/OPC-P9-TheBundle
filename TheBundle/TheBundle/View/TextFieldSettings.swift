//
//  SettingTextField.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 13/07/2021.
//

import UIKit

@IBDesignable final class TextFieldSettings: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        layer.borderWidth = 0

        if isEditing {
            layer.borderWidth = 2
            layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
}
