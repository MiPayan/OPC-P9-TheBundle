//
//  SettingTextView.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 13/07/2021.
//

import UIKit

@IBDesignable final class TextViewSettings: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = #colorLiteral(red: 0.8548173904, green: 0.8549613953, blue: 0.8591036797, alpha: 1)
    }
}
