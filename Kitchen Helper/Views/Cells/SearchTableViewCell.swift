//
//  SearchTableViewCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 18/04/2024.
//

import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.montserratFont(with: 20, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        makeConstraints()
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(nameLabel)
    }
    
    func makeConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(8)
            make.centerY.equalTo(contentView)
        }
    }
    
    func configure(_ text: String) {
        nameLabel.text = text
    }
}
