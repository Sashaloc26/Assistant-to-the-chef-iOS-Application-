//
//  Categorylabel + image.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 02/02/2024.
//

import Foundation
import UIKit


struct CategoryContent {
    let categoryText: String
    let categoryImage: UIImage
    
    static func allCategoryContents() -> [CategoryContent] {
        return [
            CategoryContent(categoryText: "Soups", categoryImage: UIImage(named: "soup")!),
            CategoryContent(categoryText: "Hot dishes", categoryImage: UIImage(named: "second_dish")!),
            CategoryContent(categoryText: "Salads", categoryImage: UIImage(named: "salad")!),
            CategoryContent(categoryText: "Snacks", categoryImage: UIImage(named: "snacks")!),
            CategoryContent(categoryText: "Dessert", categoryImage: UIImage(named: "dessert")!),
            CategoryContent(categoryText: "Beverages", categoryImage: UIImage(named: "beverages")!)
        ]
    }
}





