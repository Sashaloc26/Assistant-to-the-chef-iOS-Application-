//
//  CategoryProducts.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 08/02/2024.
//

import Foundation
import UIKit


struct CategoryProducts {
    let categoryProductsImage: UIImage
    
    static func allCategoryProductsContents() -> [CategoryProducts] {
        return [
            CategoryProducts(categoryProductsImage: UIImage(named: "pig")!),
            CategoryProducts(categoryProductsImage: UIImage(named: "fish")!),
            CategoryProducts(categoryProductsImage: UIImage(named: "chicken")!),
            CategoryProducts(categoryProductsImage: UIImage(named: "vegetables")!),
            CategoryProducts(categoryProductsImage: UIImage(named: "mushrooms")!)
        ]
    }
}
