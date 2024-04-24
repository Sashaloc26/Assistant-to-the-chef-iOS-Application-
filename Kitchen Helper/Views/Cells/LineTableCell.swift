//
//  LineTableCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 04/03/2024.
//

import UIKit

class LineTableCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
