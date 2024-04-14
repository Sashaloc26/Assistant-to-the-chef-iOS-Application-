//
//  HotDishesViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation
import RealmSwift

class HotDishesViewModel {
    var recipesHotDishes: [Recipe] = []
    
    func getHotDishesRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesHotDishes = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
    
    func filterRecipesByIngredient(_ ingredient: String) {
        recipesHotDishes = recipesHotDishes.filter { recipe in
            return recipe.ingredients.contains(ingredient)
        }
    }
}
