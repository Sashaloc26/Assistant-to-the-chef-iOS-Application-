//
//  BackButton.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 06/02/2024.
//

import UIKit

class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        tintColor = .white
    }
}
