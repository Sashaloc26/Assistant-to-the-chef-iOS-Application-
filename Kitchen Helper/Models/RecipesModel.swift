//
//  RecipesModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 17/02/2024.
//

import Foundation
import RealmSwift
import UIKit

class Recipe: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var ownerId: String = "" // 
    @Persisted var name: String = ""
    @Persisted var ingredients = List<String>()
    @Persisted var instructions: String = ""
    @Persisted var cookingTime: String = ""
    @Persisted var calories: String = ""
    @Persisted var photo: String? = nil
    @Persisted var category: RecipeCategory?
    @Persisted var favourites: Bool = false
}

class RecipeCategory: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var categoryName: String = ""
    let recipes = List<Recipe>()
}

class Purchase: Object {
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String = ""
}

