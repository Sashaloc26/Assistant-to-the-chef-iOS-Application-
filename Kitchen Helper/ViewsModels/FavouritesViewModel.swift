//
//  FavouritesViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 01/04/2024.
//

import Foundation

class FavouritesViewModel {
    var favouritesRecipes: [Recipe] = []
    
    func getFavouritesRecipe(completion: @escaping () -> Void) {
        self.favouritesRecipes =  RecipeManager.shared.getFavouriteRecipes()
        completion()
    }
}
