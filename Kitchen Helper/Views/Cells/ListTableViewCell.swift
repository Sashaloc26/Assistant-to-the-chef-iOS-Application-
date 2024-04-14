//
//  ListTableViewCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 08/04/2024.
//

import UIKit
import SnapKit
import RealmSwift

class ListTableViewCell: UITableViewCell {
    private let dotView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 15, weight: .medium)
        return label
    }()
    
        let trashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        makeConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(dotView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(trashButton)
    }
    
    func makeConstraints() {

        dotView.snp.makeConstraints { make in
            make.width.height.equalTo(8)
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(dotView.snp.trailing).offset(15)
        }
        
        trashButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(30)
        }
    }
    
    func configure(with text :String) {
        titleLabel.text = text
    }
}
