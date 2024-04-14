//
//  RecipeDescriptionCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 03/03/2024.
//

import UIKit
import SnapKit

class RecipeDescriptionCell: UITableViewCell {
    let descriptionRecipeTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .lightGray
        textView.textAlignment = .natural
        textView.font = Fonts.montserratFont(with: 16, weight: .regular)
        return textView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension RecipeDescriptionCell {
    func setupViews () {
        contentView.addSubview(descriptionRecipeTextView)
    }
    
    func makeConstraints () {
        descriptionRecipeTextView.snp.makeConstraints { make in
            make.trailing.leading.bottom.top.equalToSuperview()
        }
    }
    
    func configure(description: String) {
        descriptionRecipeTextView.text = description
    }
}
