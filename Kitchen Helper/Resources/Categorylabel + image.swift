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
            CategoryContent(categoryText: "Первые блюда", categoryImage: UIImage(named: "soup")!),
            CategoryContent(categoryText: "Вторые блюда", categoryImage: UIImage(named: "second_dish")!),
            CategoryContent(categoryText: "Салаты", categoryImage: UIImage(named: "salad")!),
            CategoryContent(categoryText: "Закуски", categoryImage: UIImage(named: "snacks")!),
            CategoryContent(categoryText: "Десерты", categoryImage: UIImage(named: "dessert")!),
            CategoryContent(categoryText: "Напитки", categoryImage: UIImage(named: "beverages")!)
        ]
    }
}
