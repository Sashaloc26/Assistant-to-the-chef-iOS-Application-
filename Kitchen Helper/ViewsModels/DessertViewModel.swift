//
//  DessertViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation
import Combine

class DessertViewModel {
    @Published var recipesDesserts: [Recipe] = []
    private var cancellables = Set<AnyCancellable>()

    func getDessertsRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesDesserts = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
}
