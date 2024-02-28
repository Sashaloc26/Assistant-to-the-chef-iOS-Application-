//
//  RecipeTableCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/02/2024.
//

import UIKit
import SnapKit

class RecipeTableCell: UITableViewCell {


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
    }
    
    func makeConstraints() {
        
    }
    
}
