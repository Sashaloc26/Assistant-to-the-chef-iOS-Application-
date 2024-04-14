//
//  FullInfoRecipeViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 01/04/2024.
//

import Foundation

class FullInfoRecipeViewModel {
    
    func addToFavourites(recipe: Recipe?) {
        RecipeManager.shared.toggleFavourite(for: recipe ?? Recipe())
    }
    
    func deleteFromFavourites(recipe: Recipe?) {
        RecipeManager.shared.deleteFavourites(for: recipe ?? Recipe())
    }
}
