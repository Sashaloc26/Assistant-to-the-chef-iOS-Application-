//
//  SaladsViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation
import Combine

class SaladsViewModel {
    @Published var recipesSalads: [Recipe] = []
    private var cancellables = Set<AnyCancellable>()
    
    func getSaladsRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesSalads = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
    
    func filterRecipesByIngredient(_ ingredient: String) {
        recipesSalads = recipesSalads.filter { recipe in
            return recipe.ingredients.contains(ingredient)
        }
    }
}
