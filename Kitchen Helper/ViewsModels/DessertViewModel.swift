//
//  DessertViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation

class DessertViewModel {
    var recipesDesserts: [Recipe] = []
    
    func getDessertsRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesDesserts = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
}
