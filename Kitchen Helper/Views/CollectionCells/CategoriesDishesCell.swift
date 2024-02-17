//
//  CategoriesDishesCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 30/01/2024.
//

import UIKit
import SnapKit

class CategoriesDishesCell: UICollectionViewCell {
    let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 0.6)
        label.font = Fonts.montserratFont(with: 12, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    var categoryImageView: UIImageView = {
        let image = UIImageView()
        return image
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
        contentView.addSubview(categoryNameLabel)
        contentView.addSubview(categoryImageView)
        
        contentView.backgroundColor = .white
        
    }
    
    func makeConstraints() {
        categoryNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView).offset(15)
        }
        
        categoryImageView.snp.makeConstraints { make in
            make.bottom.equalTo(categoryNameLabel.snp.top)
            make.centerX.equalTo(contentView)
            make.width.height.equalTo(50)
        }
    }

    
    func configure(title: String, image: UIImage?) {
        categoryNameLabel.text = title
        categoryImageView.image = image
    }
}
