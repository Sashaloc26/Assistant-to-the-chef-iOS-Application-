//
//  BeveragesViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation
import Combine

class BeveragesViewModel {
    @Published var recipesBeverages: [Recipe] = []
    private var cancellables = Set<AnyCancellable>()

    func getBeveragesRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.recipesBeverages = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
}
