//
//  SoupsVIewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation
import RealmSwift
import Combine

class SoupsViewModel {
    @Published var soupsRecipes: [Recipe] = []
    var firstFourCharactersArray = [String]()
    private var cancellables = Set<AnyCancellable>()
    
    func getSoupRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.soupsRecipes = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
    
    func filterRecipesByIngredient(_ ingredient: String) {
        soupsRecipes = soupsRecipes.filter { recipe in
            return recipe.ingredients.contains(ingredient)
        }
    }
}

