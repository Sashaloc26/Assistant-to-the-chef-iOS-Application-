//
//  FavouritesViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 01/04/2024.
//

import Foundation
import FirebaseAuth

class FavouritesViewModel {
    var userId = ""
    var favouritesRecipes: [Recipe] = []
    
    func getFavouritesRecipe(completion: @escaping () -> Void) {
        if let currentUser = Auth.auth().currentUser {
            userId = currentUser.uid
        } else {
            print("User not found")
        }
        
        self.favouritesRecipes = RecipeManager.shared.getFavouriteRecipes(ownerId: userId)
        print("Fetched favourites: \(self.favouritesRecipes)") 
        completion()
    }
}
