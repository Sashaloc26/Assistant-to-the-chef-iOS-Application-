//
//  SnacksViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation
import Combine

class SnacksViewModel {
    @Published var recipesSnacks: [Recipe] = []
    private var cancellables = Set<AnyCancellable>()

    func getSnacksRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesSnacks = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
    
    func filterRecipesByIngredient(_ ingredient: String) {
        recipesSnacks = recipesSnacks.filter { recipe in
            return recipe.ingredients.contains(ingredient)
        }
    }
}
