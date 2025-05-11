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
            print("Current user ID: \(userId)") // Проверяем ID пользователя
        } else {
            print("User not found") // Проверяем, что пользователь найден
        }
        
        self.favouritesRecipes = RecipeManager.shared.getFavouriteRecipes(ownerId: userId)
        print("Fetched favourites: \(self.favouritesRecipes)") // Лог для проверки полученных рецептов
        completion()
    }
}
