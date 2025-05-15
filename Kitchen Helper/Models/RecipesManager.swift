import Foundation
import RealmSwift
import FirebaseAuth

class RecipeManager {
    static let shared = RecipeManager()
    
    private init() {
        let config = Realm.Configuration(
            schemaVersion: 10,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 10 {
                    
                }
            }
        )
        
        Realm.Configuration.defaultConfiguration = config
    }
    
    lazy var realm: Realm = {
        do {
            return try Realm()
        } catch {
            fatalError("Failed to open Realm: \(error)")
        }
    }()
    
    func createRecipeIfNeeded(name: String, ingredients: [String], instructions: String, cookingTime: String, calories: String, photo: String?, category: RecipeCategory?, favourites: Bool = false, ownerId: String) {
        if recipeExists(withName: name) {
            return
        }
        
        createRecipe(name: name, ingredients: ingredients, instructions: instructions, cookingTime: cookingTime, calories: calories, photo: photo, category: category, ownerId: ownerId, favourites: favourites)
    }
    
    private func recipeExists(withName name: String) -> Bool {
        let existingRecipe = realm.objects(Recipe.self).filter("name == %@", name).first
        return existingRecipe != nil
    }
    
    func addCategoriesIfNeeded() {
        let categories = ["Soups", "Hot", "Salads", "Snacks", "Desserts", "Beverages"]
        
        do {
            try realm.write {
                for categoryName in categories {
                    if !categoryExists(withName: categoryName) {
                        let category = RecipeCategory()
                        category.categoryName = categoryName
                        realm.add(category)
                    }
                }
            }
        } catch {
            print("Error adding categories: \(error.localizedDescription)")
        }
    }

    private func categoryExists(withName name: String) -> Bool {
        let existingCategory = realm.objects(RecipeCategory.self).filter("categoryName == %@", name).first
        return existingCategory != nil
    }
    
    func createRecipe(name: String, ingredients: [String], instructions: String, cookingTime: String, calories: String, photo: String?, category: RecipeCategory?, ownerId: String, favourites: Bool = false) {
        let newRecipe = Recipe()
        newRecipe.name = name
        newRecipe.ingredients.append(objectsIn: ingredients)
        newRecipe.instructions = instructions
        newRecipe.cookingTime = cookingTime
        newRecipe.calories = calories
        newRecipe.photo = photo
        newRecipe.category = category
        newRecipe.favourites = favourites
        newRecipe.ownerId = ownerId 

        try! realm.write {
            realm.add(newRecipe)
        }
    }
    
    func getAllRecipes() -> [Recipe] {
        let allRecipes = realm.objects(Recipe.self)
        return Array(allRecipes)
    }
    
    func getCategoryByName(_ categoryName: String) -> RecipeCategory? {
        let category = realm.objects(RecipeCategory.self).filter("categoryName == %@", categoryName).first
        return category
    }
    
    func getCategoryById(_ id: String) -> RecipeCategory? {
        let category = realm.objects(RecipeCategory.self).filter("id == %@", id).first
        return category
    }
    
    func getRecipesForCategory(_ categoryName: String) -> [Recipe] {
            do {
                let realm = try Realm()
                let recipes = realm.objects(Recipe.self).filter("category.categoryName == %@", categoryName)
                return Array(recipes)
            } catch {
                print("Ошибка при получении рецептов: \(error.localizedDescription)")
                return []
            }
        }
    
    func getRecipesForName(_ recipeName: String) -> [Recipe] {
        do {
            let realm = try Realm()
            let recipes = realm.objects(Recipe.self).filter("name BEGINSWITH[c] %@", recipeName.prefix(3))
            return Array(recipes)
        } catch {
            print("Ошибка при получении рецептов: \(error.localizedDescription)")
            return []
        }
    }

    
    func deleteRecipe(_ recipe: Recipe) {
        do {
            try realm.write {
                realm.delete(recipe)
            }
        } catch {
            print("Error deleting recipe: \(error.localizedDescription)")
        }
    }
    
    func deleteCategory(_ categories: RecipeCategory) {
        do {
            try realm.write {
                realm.delete(categories)
            }
        } catch {
            print("Error deleting recipe: \(error.localizedDescription)")
        }
    }
    
    func toggleFavourite(for recipe: Recipe) {
        do {
            try realm.write {
                recipe.favourites.toggle() 
            }
        } catch {
            print("Error toggling favourite: \(error.localizedDescription)")
        }
    }
    
    func deleteFavourites(for recipe: Recipe) {
        do {
            try realm.write {
                recipe.favourites = false
            }
        } catch {
            print("Error toggling favourite: \(error.localizedDescription)")
        }
    }
    
    func getFavouriteRecipes(ownerId: String) -> [Recipe] {
        do {
            let realm = try Realm()
            
            let allRecipes = realm.objects(Recipe.self)
            print("All recipes: \(allRecipes)")
            
            let favouriteRecipes = realm.objects(Recipe.self).filter("ownerId == %@ AND favourites == true", ownerId)
            return Array(favouriteRecipes)
        } catch {
            print("Ошибка при получении избранных рецептов: \(error.localizedDescription)")
            return []
        }
    }
    
    func updateOwnerIdForAllRecipesIfNeeded(currentUserId: String) {
        do {
            let recipes = realm.objects(Recipe.self).filter("ownerId != %@", currentUserId)
            try realm.write {
                for recipe in recipes {
                    recipe.ownerId = currentUserId
                }
            }
            print("Обновлены ownerId для \(recipes.count) рецептов.")
        } catch {
            print("Ошибка при обновлении ownerId: \(error.localizedDescription)")
        }
    }
}


