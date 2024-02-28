//
//  SnacksViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation

class SnacksViewModel {
    var recipesSnacks: [Recipe] = []
    
    func getSnacksRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesSnacks = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
}
