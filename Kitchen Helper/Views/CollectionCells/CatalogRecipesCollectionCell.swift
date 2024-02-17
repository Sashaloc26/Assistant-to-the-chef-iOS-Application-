//
//  CatalogRecipesCollectionCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 12/02/2024.
//

import UIKit
import SnapKit

class CatalogRecipesCollectionCell: UICollectionViewCell {
    var catalogAvatarRecipeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "borsh")
        return image
    }()
    
    let containerView: UIView = {
        let view = UIView()
        let shadowPathRect = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.backgroundColor = .white
        view.layer.shadowPath = UIBezierPath(rect: shadowPathRect).cgPath
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 5.0
        view.layer.masksToBounds = false
        return view
    }()
    
    let titleRecipeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Fonts.montserratFont(with: 18, weight: .semibold)
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
        let attributedText = NSMutableAttributedString(string: "234\nкКал")
        attributedText.addAttribute(.foregroundColor, value: UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 0.6), range: NSRange(location: 0, length: 3))
        attributedText.addAttribute(.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 4, length: 4))
        attributedText.addAttribute(.font, value: Fonts.montserratFont(with: 10, weight: .semibold), range: NSRange(location: 0, length: 8))
        label.attributedText = attributedText
        label.numberOfLines = 2
        label.textAlignment = .justified
        return label
    }()
    
    let cookingTimeRecipeLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "30\nмин")
        attributedText.addAttribute(.foregroundColor, value: UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 0.6), range: NSRange(location: 0, length: 2))
        attributedText.addAttribute(.foregroundColor, value: UIColor.lightGray, range: NSRange(location: 3, length: 3))
        attributedText.addAttribute(.font, value: Fonts.montserratFont(with: 10, weight: .semibold), range: NSRange(location: 0, length: 6))
        label.attributedText = attributedText
        label.numberOfLines = 2
        return label
    }()
    
    let heartButton: UIButton = {
        let button = UIButton()
        let shadowPathRect = CGRect(x: 0, y: 0, width: button.bounds.width, height: button.bounds.height)
        button.layer.cornerRadius = 25
        button.backgroundColor = .lightGray
        button.layer.shadowPath = UIBezierPath(rect: shadowPathRect).cgPath
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
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
            make.trailing.equalTo(containerView.snp.trailing).offset(5)
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
        
        
        func configure(title: String, image: UIImage?) {
            
        }
    }
}
