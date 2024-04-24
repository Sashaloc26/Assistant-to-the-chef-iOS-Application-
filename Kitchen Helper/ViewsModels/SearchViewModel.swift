//
//  SearchViewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 18/04/2024.
//

import Foundation

class SearchViewModel {
    var searchResults: [Recipe] = []
    
    func findRecipes(_ name: String, completion: @escaping () -> Void) {
        self.searchResults = RecipeManager.shared.getRecipesForName(name)
        completion()
    }
    
    func clearSearchResults() {
        searchResults.removeAll()
    }
}
