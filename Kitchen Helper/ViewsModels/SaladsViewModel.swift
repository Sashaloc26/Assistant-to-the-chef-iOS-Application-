//
//  SaladsViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation

class SaladsViewModel {
    var recipesSalads: [Recipe] = []
    
    func getSaladsRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesSalads = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
}
