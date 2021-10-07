//
//  SettingButton.swift
//  TheBundle
//
//  Created by Mickael PAYAN on 16/07/2021.
//

import UIKit

@IBDesignable final class SettingButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }
}
