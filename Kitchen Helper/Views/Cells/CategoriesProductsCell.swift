//
//  CategoriesProductsCell.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 07/02/2024.
//

import UIKit
import SnapKit

class CategoriesProductsCell: UICollectionViewCell {
    var categoryProductsImageView: UIImageView = {
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
        contentView.addSubview(categoryProductsImageView)
        
        contentView.backgroundColor = .white
        categoryProductsImageView.contentMode = .scaleAspectFit
    }
    
    func makeConstraints() {
        categoryProductsImageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(5)
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
    }
    
    func configure(image: UIImage?) {
        categoryProductsImageView.image = image
    }
}
