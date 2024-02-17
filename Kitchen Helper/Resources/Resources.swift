//
//  Resources.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 06/02/2024.
//

import Foundation
import UIKit


enum Fonts {
    static func montserratFont(with size: CGFloat, weight: UIFont.Weight) -> UIFont {
        if let font = UIFont(name: "Montserrat-\(weight.rawValue)", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
    }
}


