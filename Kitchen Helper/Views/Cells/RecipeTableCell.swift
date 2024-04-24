//
//  RecipeTableCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/02/2024.
//

import UIKit
import SnapKit

protocol RecipeTableCellDelegate: AnyObject {
    func didTapPlusButton(in cell: RecipeTableCell)
}

class RecipeTableCell: UITableViewCell {
    weak var delegate: RecipeTableCellDelegate?
    
    private let dotView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 0.7).cgColor
        button.layer.borderWidth = 1
        return button
    }()
    
    private let plusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")
        imageView.tintColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 0.7)
        return imageView
    }()
    
    private let minusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "minus")
        imageView.tintColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 0.7)
        return imageView
    }()
    
    var isPlusButtonTapped: Bool = false {
        didSet {
            if isPlusButtonTapped {
                plusImage.image = UIImage(systemName: "minus")
                plusImage.tintColor = .lightGray
                plusButton.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                plusImage.image = UIImage(systemName: "plus")
                plusImage.tintColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 1)
                plusButton.layer.borderColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 1).cgColor
            }
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = Fonts.montserratFont(with: 13, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecipeTableCell {
    func setupCell() {
        selectionStyle = .none
        
        contentView.addSubview(dotView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(plusButton)
        plusButton.addSubview(plusImage)
    }
    
    func makeConstraints() {
        dotView.snp.makeConstraints { make in
            make.width.height.equalTo(6)
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(dotView.snp.trailing).offset(15)
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(30)
        }
        
        plusImage.snp.makeConstraints { make in
            make.centerY.equalTo(plusButton)
            make.centerX.equalTo(plusButton)
        }
    }
    
    func configure(with ingredient: String) {
        titleLabel.text = ingredient
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    @objc private func plusButtonTapped() {
        isPlusButtonTapped.toggle()
        delegate?.didTapPlusButton(in: self)
    }
}
