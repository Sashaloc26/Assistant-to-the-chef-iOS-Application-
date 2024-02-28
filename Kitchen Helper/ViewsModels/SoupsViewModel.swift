//
//  SoupsVIewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 25/01/2024.
//

import Foundation
import RealmSwift

class SoupsViewModel {
        
    var soupsRecipes: [Recipe] = []
    
    func getSoupRecipes(categoryName: String, completion: @escaping () -> Void) {
        self.soupsRecipes = RecipeManager.shared.getRecipesForCategory(categoryName)
        completion()
    }
}

