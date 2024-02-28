//
//  AppDelegate.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 20/01/2024.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        RecipeManager.shared.addCategoriesIfNeeded()
        
        let categoryName = "Супы"
        if let category = RecipeManager.shared.getCategoryByName(categoryName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Куриный суп ",
                ingredients: ["Куриный бульон - 1½ л, лук - 1 штука, морковь - 1 штука, масло - для жарки, куриное филе - 100 г, картофель - 2 штуки, мука -⅔ стакана, яйцо - 2 штуки, соль - по вкусу"],
                instructions: "1. Подготовьте ингредиенты. Поставьте бульон закипать. Тем временем почистите овощи и нашинкуйте лук. Натрите на крупной тёрке морковь. 2. Спассеруйте овощи в небольшом количестве масла до мягкости. Сгрузите в кастрюлю с закипевшим бульоном и убавьте огонь так, чтобы суп лениво булькал. Нарежьте курицу небольшими кусочками, быстро обжарьте до золотистой корочки и переложите в бульон. 3. Картошку нашинкуйте кубиками и тоже отправьте в суп. Просейте муку в глубокую тарелку. В другой миске взбейте вилкой два яйца со щепоткой соли. Вымойте и обсушите руки — начинаем делать «затирушки»! 4. Обмакните руки в яйцо, затем погрузите в муку. Потрите ладони друг о друга и счистите тесто с пальцев на чистый стол или разделочную доску. Если счищается плохо, потому что слишком липкое, зачерпните ещё немного муки. Повторяйте, пока не кончится яйцо. Аккуратно перемешайте получившиеся затирушки с мукой, чтобы они не слиплись, после чего переложите их в сито и отсейте лишнее. 5. Проверьте, сварились ли курица и картошка. Если да, то всыпьте в кастрюлю «затирушки» и готовьте всё вместе ещё 3–5 минут. Подавайте куриный суп с «затирушками» горячим. Как и любое блюдо с лапшой, разогревать его многократно нежелательно, поэтому готовьте на один раз, чтобы съесть свежим.",
                cookingTime: "30\nмин",
                calories: "190\nкКал",
                photo: "chicken_soup",
                category: category
            )
        } else {
            print("Категория '\(categoryName)' не найдена")
        }
        
        let categoryHot = "Горячее"
        if let category = RecipeManager.shared.getCategoryByName(categoryHot) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Драники с колбасой",
                ingredients: ["Картофель - 500 г, лук репчатый - 1 штука, укроп свежий - ½ пучка,  яйцо - 1 штука, мука - 45 г, соль - по вкусу, перец чёрный молотый - по вкусу, колбаса - 300 г, растительное масло - 3 ст. ложки"],
                instructions: "1. Натрите очищенный картофель. Переложите в марлю, сложенную втрое, и отожмите над миской. Слейте жидкость, сохранив оставшийся на дне крахмал. 2. Добавьте к картофелю крахмал, натёртый лук, нарезанный укроп, яйцо и муку. Посолите и поперчите. Нарежьте колбасу ломтиками. 3. В сковороде на среднем огне разогрейте растительное масло. Выложите немного картофельной массы и разровняйте. Поместите на неё ломтик колбасы, сверху покройте картошкой. 4. Так же сформируйте остальные драники. Обжаривайте по 5 минут с каждой стороны до румяности..",
                cookingTime: "40\nмин",
                calories: "465\nкКал",
                photo: "draniki",
                category: category
            )
        } else {
            print("Категория '\(categoryHot)' не найдена")
        }
        
        let config = Realm.Configuration(
            schemaVersion: 5,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 5 {

                }
            }
        )
        
        Realm.Configuration.defaultConfiguration = config
        
        let realm = try! Realm()
        let allCategories = realm.objects(RecipeCategory.self)
        
        for category in allCategories {
            print(category.categoryName)
        }
        
        let allRecipes = RecipeManager.shared.getAllRecipes()

//        for recipe in allRecipes {
//            RecipeManager.shared.deleteRecipe(recipe)
//        }
//        
//        for category in allCategories {
//            RecipeManager.shared.deleteCategory(category)
//        }
//        
        for recipe in allRecipes {
            print(recipe)
        }
                
//        if let recipeToDelete = realm.objects(Recipe.self).first {
//            RecipeManager.shared.deleteRecipe(recipeToDelete)
//        }
        
//        if allRecipes.count >= 2 {
//            let recipeToDelete = allRecipes[1]
//            RecipeManager.shared.deleteRecipe(recipeToDelete)
//        } else {
//            print("В массиве рецептов отсутствует второй рецепт")
//        }
        
        return true
    }
}
