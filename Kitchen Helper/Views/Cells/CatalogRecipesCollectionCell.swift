//
//  CatalogRecipesCollectionCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 12/02/2024.
//

import UIKit
import SnapKit
import RealmSwift

class CatalogRecipesCollectionCell: UICollectionViewCell {
    var catalogAvatarRecipeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "borsh")
        return image
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let titleRecipeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Fonts.montserratFont(with: 16, weight: .semibold)
        label.text = "Суп из тыквы"
        return label
    }()
    
    let descriptionRecipe: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = Fonts.montserratFont(with: 14, weight: .medium)
        label.numberOfLines = 0
        label.text = "Бураки, говядина, картошка, капуста"
        label.textAlignment = .natural
        return label
    }()
    
    let caloriesRecipeLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.montserratFont(with: 10, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    let cookingTimeRecipeLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.montserratFont(with: 10, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    let heartButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .lightGray
        return button
    }()
    
    let heartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        makeConstraints()
    }
    
    func setupViews() {
        contentView.addSubview(catalogAvatarRecipeImageView)
        catalogAvatarRecipeImageView.addSubview(containerView)
        containerView.addSubview(titleRecipeLabel)
        containerView.addSubview(descriptionRecipe)
        containerView.addSubview(caloriesRecipeLabel)
        containerView.addSubview(cookingTimeRecipeLabel)
        containerView.addSubview(heartButton)
        heartButton.addSubview(heartImage)
        
    }
    
    func makeConstraints() {
        catalogAvatarRecipeImageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing)
            make.leading.equalTo(contentView.snp.centerX)
            make.top.equalTo(contentView.snp.top)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        containerView.snp.makeConstraints { make in
            make.trailing.equalTo(catalogAvatarRecipeImageView.snp.leading).offset(30)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }

        titleRecipeLabel.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading).offset(15)
            make.top.equalTo(containerView.snp.top).offset(10)
            make.height.equalTo(17)
        }
        
        descriptionRecipe.snp.makeConstraints { make in
            make.leading.equalTo(titleRecipeLabel.snp.leading)
            make.trailing.equalTo(containerView.snp.trailing)
            make.top.equalTo(titleRecipeLabel.snp.bottom).offset(5)
            make.height.equalTo(35)
        }
        
        caloriesRecipeLabel.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.centerX)
            make.top.equalTo(descriptionRecipe.snp.bottom)
            make.bottom.equalTo(containerView.snp.bottom)
            make.width.equalTo(30)
        }
        
        cookingTimeRecipeLabel.snp.makeConstraints { make in
            make.leading.equalTo(caloriesRecipeLabel.snp.trailing).offset(20)
            make.top.equalTo(descriptionRecipe.snp.bottom)
            make.bottom.equalTo(containerView.snp.bottom)
            make.width.equalTo(30)
            
        }
        
        heartButton.snp.makeConstraints { make in
            make.centerY.equalTo(containerView.snp.bottom)
            make.leading.equalTo(titleRecipeLabel.snp.leading)
            make.width.height.equalTo(50)
        }
        
        heartImage.snp.makeConstraints { make in
            make.centerX.equalTo(heartButton)
            make.centerY.equalTo(heartButton)
            make.width.height.equalTo(30)
        }
    }
    
    func applyShadow() {
        let shadowPathRect = CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height)
        containerView.layer.shadowPath = UIBezierPath(rect: shadowPathRect).cgPath
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = 4.0
        containerView.layer.masksToBounds = false
        
        
        let circlePath = UIBezierPath(roundedRect: heartButton.bounds, cornerRadius: heartButton.bounds.size.width / 2.0)
        heartButton.layer.shadowPath = circlePath.cgPath
        heartButton.layer.shadowColor = UIColor.black.cgColor
        heartButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        heartButton.layer.shadowOpacity = 0.3
        heartButton.layer.shadowRadius = 4
        heartButton.layer.masksToBounds = false
    }
    
    func configure(title: String, image: UIImage, description: List<String>, calories: String, time: String) {
        
        let descriptionArray = Array(description)
        catalogAvatarRecipeImageView.image = image
        titleRecipeLabel.text = title
        descriptionRecipe.text = descriptionArray.joined(separator: "\n")
        caloriesRecipeLabel.text = calories
        cookingTimeRecipeLabel.text = time
    }
}
