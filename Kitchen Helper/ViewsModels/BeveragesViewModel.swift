//
//  BeveragesViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation

class BeveragesViewModel {
    var recipesBeverages: [Recipe] = []
    
    func getBeveragesRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesBeverages = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
}
