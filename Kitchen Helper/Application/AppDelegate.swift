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
        
        let categorySoupName = "Soups"
        if let category = RecipeManager.shared.getCategoryByName(categorySoupName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Chicken soup",
                ingredients: ["Chicken broth - 1½ l", "Onion - 1 piece", "Carrots - 1 piece", "Oil - for frying", "Chicken fillet - 100 g", "Potatoes - 2 pieces", "Flour - ⅔ cup" , "Egg - 2 pieces", "Salt - to taste", "Chicken", "Vegetables"],
                instructions: "1. Prepare the ingredients. Bring the broth to a boil. Meanwhile, clean the vegetables and chop the onion. Grate the carrots using a coarse grater.\n\n2.Sauté the vegetables in a small amount of oil until soft. Transfer them to the pot with the boiling broth and reduce the heat so that the soup simmers lazily. Cut the chicken into small pieces, quickly fry until golden brown, and transfer to the broth.Dice the potatoes and add them to the soup. Sift the flour onto a deep plate. In another bowl, beat two eggs with a pinch of salt using a fork. Wash and dry your hands - it's time to make 'zatirushki'!Dip your hands in the egg, then dredge in the flour. Rub your palms together and scrape the dough off your fingers onto a clean table or cutting board. If it doesn't scrape off well because it's too sticky, add a little more flour. Repeat until you run out of egg.\n\n3. Gently mix the resulting 'zatirushki' with the flour so they don't stick together, then transfer them to a sieve and sift off the excess.Check if the chicken and potatoes are cooked. If yes, add the 'zatirushki' to the pot and cook everything together for another 3-5 minutes. Serve the chicken soup with 'zatirushki' hot. Like any noodle dish, it's not advisable to reheat it multiple times, so prepare it to be eaten fresh.",
                cookingTime: "30\nmin",
                calories: "190\nkcal",
                photo: "chicken_soup",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categorySoupName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Borsch",
                ingredients: ["1½–2 liters of water", "400–500 g of beef on the bone", "2 small beets", "1 medium carrot", "3 medium onions", "4 tablespoons of vegetable oil", "A pinch of citric acid" , "A little table vinegar", "2 tablespoons of tomato paste", "300 g of fresh white cabbage", "4 medium potatoes", "Salt - to taste", "1-2 dried bay leaves", "Greens - to taste", "1 clove of garlic", "A pinch of ground cloves", "A pinch of ground black pepper", "Vegetables"],
                instructions: "1. Pour cold water into a pot, add the meat, and place it over medium heat. The broth will be tastier if you use meat with bones. Watch the broth, remove any foam before it boils. Once the liquid boils, cover the pot with a lid and simmer over low heat for an hour to an hour and a half.\n\n2. Wash and peel the beets, carrots, and onion. Grate the beets coarsely and the carrots finely. Dice the onion into small cubes. Pour oil into a frying pan, set over medium heat. Sauté the onion and carrots, stirring, for about 5 minutes. Then add the beets. Add lemon juice, vinegar, or lemon juice to them. This will make the borscht truly red and give it a pleasant sourness. Cook the sauté for another 5 minutes. Then add the tomato paste, mix, and leave it on the heat for another 5-7 minutes.\n\n3. When the broth is ready, remove the meat from it. While it cools, add shredded cabbage to the pot. After 5-10 minutes, add thinly sliced or diced potatoes. The order of adding vegetables can be changed. If the cabbage is young, it's better to add it after the potatoes. Or add them simultaneously if your type of potatoes cooks quickly. While the potatoes are cooking, remove the meat from the bone and dice it. Return it to the soup. Salt to taste. Add the sauté and mix. Add the bay leaf and finely chopped herbs. Cover the pot with a lid and cook for another 5-7 minutes. For aroma, you can add a little minced garlic, ground cloves, or black pepper to the pot. Leave the borscht to infuse under the lid for 5-10 minutes.",
                cookingTime: "50\nmin",
                calories: "240\nkcal",
                photo: "borsh",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categorySoupName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Cheese soup",
                ingredients: ["Hard cheese - 1 cup", "Cheddar cheese - 1 cup", "Fresh broccoli - 350 g", "Red bell pepper - 1 cup", "Potatoes - 280 g", "Red chili pepper - 2-3 pieces", "Yellow onion - 1 cup", "Garlic - 2 cloves", "Ground cumin (zira) - 1/4 tsp", "Butter - 1/4 cup", "Chicken broth - 800 g", "Flour - 1/3 cup", "Milk - 1.5 cups", "Low-fat cream (10%) - 1 cup", "Smoked ham - to taste", "Vegetables", "Chicken"],
                instructions: "1. In a large cast iron pot (cauldron), melt the butter over medium-high heat, add the bell pepper, onion, chili pepper, and garlic to the pot, cook, stirring, for about 4-5 minutes until the vegetables are soft. Then add the potatoes to the pot, sprinkle with cumin, and cook for another 5 minutes. Pour the broth into the pot, bring to a boil, cover, reduce the heat, and cook the soup for about 25 minutes.\n\n2. In a separate bowl, combine the flour, milk, and cream, mix well with a whisk or fork. Pour this mixture into the pot and cook over medium-low heat, stirring, until thickened, about 5 minutes. Reduce the heat to low.\n\n3. Add all the cheese to the pot and cook the soup until the cheese is melted, 3-5 minutes.\n\n4. Place the broccoli florets in a bowl, place in the microwave for 3-4 minutes until tender. Drain the broccoli. Add the hot broccoli to the soup.Serve the cheesy broccoli soup in individual bowls with pieces of ham (if desired).",
                cookingTime: "45\nmin",
                calories: "320\nkcal",
                photo: "cheese_soup",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categorySoupName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Bean soup",
                ingredients: ["Red kidney beans, dry - 1 cup", "Water or broth - 2-3 liters", "Yellow onion - 1 piece", "Carrot - 1 piece", "Vegetable oil for frying", "Potatoes - 1-2 pieces", "Bay leaves - 2-3 pieces", "Sausage or smoked meats - 100-150 g", "Khmeli-suneli (Georgian spice blend) - 2 tsp", "Smoked paprika - 2-3 tsp", "Herbs - 1 bunch", "Salt - to taste", "Ground black pepper - to taste", "Vegetables", "Pork"],
                instructions: "1. Prepare the ingredients. Soak the beans in cool water for 8-12 hours before cooking.\n\n2. Drain the soaked beans and rinse them. Pour 1-1.5 liters of clean water over the beans. Bring to a boil and simmer over low heat with the lid on until tender. This will take a while. How long exactly depends on the specific beans. Be patient for an hour or two, and replenish the water level if necessary.\n\n3. When the beans are almost done, you can start preparing the sauté. Dice the onion and carrot. Sauté the vegetables in heated vegetable oil until softened.\n\n4. When the beans are fully cooked, mash them slightly with a spoon or potato masher to thicken the soup base, then dilute the contents of the pot with water or broth, roughly doubling the volume. Dice or julienne the potatoes and add them to the soup along with the bay leaves. Slice the sausage into rounds. Add the sauté to the pot and cook for another five minutes. Season the soup with salt, add the spices, finely chopped herbs, and sausage. Simmer for another 2-3 minutes, then turn off the heat, cover the soup with a lid, and let it sit.",
                cookingTime: "60\nmin",
                calories: "270\nkcal",
                photo: "bean_soup",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        let categoryHotName = "Hot"
        if let category = RecipeManager.shared.getCategoryByName(categoryHotName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Draniki with sausage",
                ingredients: ["Potatoes - 500 g", "Yellow onion - 1 piece", "Fresh dill - ½ bunch", "Egg - 1 piece", "Flour - 45 g", "Salt - to taste", "Ground black pepper - to taste", "Sausage - 300 g", "Vegetable oil - 3 tbsp", "Pork", "Vegetables"],
                instructions: "1. Grate the peeled potatoes. Transfer them to a triple-folded cheesecloth and squeeze over a bowl to drain the liquid, retaining the remaining starch at the bottom.\n\n2. Add the potato starch, grated onion, chopped dill, egg, and flour to the potatoes. Season with salt and pepper. Slice the sausage into pieces.\n\n3. Heat the vegetable oil in a skillet over medium heat. Place a portion of the potato mixture and flatten it out. Place a slice of sausage on top, then cover with more potato mixture.4. Form the remaining potato pancakes in the same way. Fry each side for 5 minutes until golden brown.",
                cookingTime: "40\nmin",
                calories: "465\nkcal",
                photo: "draniki",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categoryHotName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Meat with sesame",
                ingredients: ["Meat (any!) - 500 g", "Honey - 2 tbsp", "Lemon juice - 1 tbsp (15-20 g)", "Sesame seeds - 30-50 g", "Vegetable oil - 1-2 tbsp", "Salt - to taste", "Pepper - to taste", "Vegetables", "Pork"],
                instructions: "1. Slice the meat into chunks. Transfer to a deep plate, season with salt and pepper, drizzle with lemon juice, add liquid (melted) honey, and mix everything thoroughly. Let it marinate for about 40 minutes, preferably an hour.\n\n2. Toast the sesame seeds in a dry skillet, stirring, until golden brown. Transfer the meat along with the marinade to the skillet and simmer until it is no longer pink. Then drain the marinade - we will use it as a sauce.\n\n3. Add a little vegetable oil to the skillet and fry the meat for about 20-25 minutes. In the last 5 minutes, add the sesame seeds and make sure the meat with sesame seeds doesn't burn.",
                cookingTime: "40\nmin",
                calories: "480\nkcal",
                photo: "meat_with_sesame_seeds",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categoryHotName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Buckwheat in cream",
                ingredients: ["Buckwheat groats - 130 g", "Chicken fillet - 300 g", "Frozen wild mushrooms - 150 g", "Hard cheese - 50 g", "Garlic - 1 clove", "10% cream - 100 g", "Vegetable oil - 2 tbsp", "Salt - 1/2 tsp (to taste)", "Vegetables", "Chicken"],
                instructions: "1. Prepare all the necessary ingredients. I'm using frozen wild mushrooms, but you can use any other type, such as button mushrooms. Rinse the chicken fillet, pat dry, and cut into medium-sized pieces. Place the chicken in a skillet with heated vegetable oil, and fry for 7 minutes over medium heat, stirring occasionally.\n\n2. If needed, slice the mushrooms into medium-sized pieces and add them to the skillet. Season with salt and continue to cook for another 7 minutes, stirring occasionally. Rinse the buckwheat groats and let the water drain completely. Peel and finely chop the garlic. Add the buckwheat groats and garlic to the skillet. Stir everything together and cook for 3-5 minutes over low heat.\n\n3. Then pour in the cream. Add the grated cheese. Mix well. Pour in 250 ml of water. Mix again.\n\n4. Once it starts boiling, cook over low heat with the lid on for 20-25 minutes until done. Buckwheat with chicken, mushrooms, cheese, and cream (in the skillet) is ready.",
                cookingTime: "50\nmin",
                calories: "390\nkcal",
                photo: "buckwheat_with_meat",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categoryHotName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Pork chops",
                ingredients: ["Pork - 350 g", "Hard cheese - 100 g", "Yellow onion - 50 g", "Carrot - 50 g (1 small)", "Garlic - 1-2 cloves", "Mayonnaise - 70-80 g", "Vegetable oil - 40 ml", "Salt - 0.25 tsp", "Ground black pepper", "Fresh parsley (for serving)", "Vegetables", "Pork"],
                instructions: "1. Slice the pork into 1-1.5 cm thick slices. Tenderize the meat using a meat mallet, season with salt and pepper. Peel and press the garlic. Rub each slice with garlic and let it marinate while preparing the other ingredients. If time allows, refrigerate the meat for an hour.\n\n2. Preheat the oven to 180 degrees Celsius. Peel and thinly slice the onion. Grate the peeled carrot using a coarse grater. Heat the vegetable oil in a skillet, add the vegetables, and sauté, stirring, for 3-4 minutes (until softened).\n\n3. Lightly grease a baking dish with vegetable oil (0.5 tbsp), arrange the pork slices, and spread mayonnaise over them. Evenly distribute the sautéed onions and carrots on top. Place the dish in the preheated oven at 180 degrees Celsius for 35 minutes.\n\n4. After the time has elapsed, remove the dish from the oven. Grate the cheese on a fine grater and spread it over the pork and vegetables. Return the dish to the oven and bake the meat for another 10-15 minutes at the same temperature. Serve the pork schnitzels with carrots and cheese immediately, garnished with parsley leaves.",
                cookingTime: "70\nmin",
                calories: "340\nkcal",
                photo: "pork_chops",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        let categorySaladName = "Salads"
        if let category = RecipeManager.shared.getCategoryByName(categorySaladName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Warm salad",
                ingredients: ["Chicken fillet - 400 g", "Bell pepper - 1 piece", "Tomatoes - 300 g", "Lettuce leaves - 1 bunch", "Sesame seeds - 1 tbsp", "Soy sauce - 50 ml", "Olive oil - 3 tbsp", "Balsamic vinegar - 1 tbsp", "Fresh dill - 2-3 sprigs", "Salt - 1/3 tsp", "Ground black pepper", "Vegetables", "Chicken", "Mushrooms"],
                instructions: "1. Using a sharp knife, slice the chicken fillet into thin slices about 5-7 mm thick. Place the chicken fillet in a bowl. Add salt, black pepper, and soy sauce. Mix well. Let the chicken marinate for 10-20 minutes.\n\n2. Fry the marinated chicken fillet in olive oil until golden brown on one side, about 5-7 minutes. Then flip the chicken pieces and continue to fry for another 5 minutes. While the chicken fillet is frying, cut the bell pepper into small irregular pieces. In the remaining oil after frying the fillet, lightly fry the bell pepper for 3 minutes, stirring constantly.\n\n3. Wash the lettuce leaves, pat them dry, tear them into large pieces by hand, and arrange them on a serving plate. Cut the tomatoes into small wedges. If you have small plum tomatoes, like mine, you can slice them into rounds. Arrange the pieces of roasted bell pepper on top.\n\n4. Arrange the still warm chicken pieces on top of the vegetables. Garnish the salad with dill leaves and drizzle with balsamic vinegar. Sprinkle the warm salad with chicken, roasted bell pepper, and tomatoes with sesame seeds.",
                cookingTime: "35\nmin",
                calories: "1060\nkcal",
                photo: "warm_salad",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categorySaladName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Mimosa salad",
                ingredients: ["Сairow fish (canned) - 1-2 cans", "Onion - 1 piece", "Chicken eggs - 5-6 pieces", "Hard cheese - 100 g", "Boiled carrots - 3-4 pieces", "Boiled potatoes - 4 pieces", "Mayonnaise - to taste", "Greens - to taste", "Vegetables", "Fish"],
                instructions: "1. Finely chop the onion. Grate the cheese, carrots, and potatoes using a coarse grater.\n\n2. Separate the egg whites from the yolks. Mash the yolks with a fork, and grate the whites using a coarse grater. Mash the canned fish with a fork. Chop the greens.\n\n3. Assemble the salad. The first layer is potatoes followed by a layer of mayonnaise. The subsequent layers include onion, cheese, mayonnaise, grated egg whites, fish, and mayonnaise. Then add carrots and mayonnaise. Sprinkle with greens and chopped yolks on top.",
                cookingTime: "30\nmin",
                calories: "930\nkcal",
                photo: "salat_mimoza",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categorySaladName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Salad Tenderness",
                ingredients: ["Sausage (boiled) - 150 g", "Processed cheese - 90 g", "Fresh cucumber - 1 piece", "Eggs - 2 pieces", "Green peas - 70-80 g", "Mayonnaise - 80-100 g", "Salt - to taste", "Vegetables"],
                instructions: "1. We'll combine the chopped ingredients directly in a salad bowl. The next ingredient is the fresh cucumber. It's recommended not to peel it. Of course, make sure to wash the cucumber well. Cut the cucumber into cubes similar in size to the sausage. Let's start with the boiled sausage. Cut it into small cubes.\n\n2. We'll simply grate the processed cheese on a coarse grater. (To make it easier to grate, you can chill the cheese in the freezer for about 15 minutes.)\n\n3. Peel the cooled boiled eggs and cut them into similar-sized cubes as the sausage and cucumber. The canned green peas are the final component of the salad. Drain the liquid, strain the peas, and transfer them to the salad bowl. We'll use mayonnaise as the dressing. Mix the salad, add salt to taste.",
                cookingTime: "20\nmin",
                calories: "1230\nkcal",
                photo: "salad_ tenderness",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        let categorySnacksName = "Snacks"
        if let category = RecipeManager.shared.getCategoryByName(categorySnacksName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Cheese sticks",
                ingredients: ["Hard cheese - 300 g", "Egg - 1", "Flour - 30 g", "Vegetable oil - 70 ml"],
                instructions: "1. Grate the cheese finely, add flour, and egg. Mix well. Shape the mixture into cheese sticks.\n\n2. Fry them in vegetable oil until golden brown.",
                cookingTime: "30\nmin",
                calories: "750\nkcal",
                photo: "cheese_snacks",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categorySnacksName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Lavash snack",
                ingredients: ["Thin lavash - 2 pieces.", "Eggs - 3 pieces.", "Imitation crab sticks - 200 g", "Russian cheese - 100 g", "Processed cheese - 200 g", "Garlic - 3-4 cloves", "Dill", "Ground black pepper, Mayonnaise", "Vegetables", "Fish"],
                instructions: "1. Boil the eggs. Grate the cheese and eggs using a coarse grater. Grate the garlic using a fine grater. Finely chop the herbs and crab sticks. Mix everything together and dress with mayonnaise.\n\n2. Place one of the lavash sheets on the table. Carefully spread half of the filling over its entire surface. Then lay the second lavash sheet. Spread the second half of the filling. Now carefully roll up the lavash into a roll. You can wrap it in plastic wrap or foil.\n\n3. Put the appetizer in the refrigerator for 2-3 hours. Before serving, slice into pieces about 3-4 cm thick.",
                cookingTime: "35\nmin",
                calories: "490\nkcal",
                photo: "lavash_snack",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        if let category = RecipeManager.shared.getCategoryByName(categorySnacksName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Potato pie",
                ingredients: ["Potatoes - 250 grams", "Vegetable oil - 150 milliliters", "Salt - 1/2 teaspoon", "Vegetables"],
                instructions: "1. Peel the potatoes. Grate them using a Korean carrot grater.\n\n2. Place the grated potatoes in a colander and rinse them under running water. Let excess liquid drain. Then, season the potatoes generously with salt.\n\n3. Fry them.",
                cookingTime: "30\nmin",
                calories: "550\nkcal",
                photo: "fries_pie",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        let categoryDessertsName = "Desserts"
        if let category = RecipeManager.shared.getCategoryByName(categoryDessertsName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Classic cheesecake",
                ingredients: ["Biscuits - 200 g", "Butter - 100 g", "Sugar - 50 g", "Salt - 1/4 tsp", "Cream cheese - 1 kg", "Heavy cream (30%) - 200 g", "Large eggs - 4", "Sugar - 1 cup or to taste", "Lemon zest - 1 tsp", "Lemon juice - 1 tbsp", "Salt - 1/2 tsp"],
                instructions: "1. Preheat the oven to 180 degrees Celsius. Grease a springform pan with butter. Using a blender, finely crush the biscuits. Add melted butter, sugar, and salt, mix well. Press the mixture into the pan, evenly distributing it along the bottom and edges. Place the cheesecake crust in the oven. Reduce the temperature to 150 degrees Celsius. Bake for 12-15 minutes. Then cool on a wire rack.\n\n2. Using a mixer on medium speed, beat the cream cheese (at room temperature). Gradually add sugar, lemon zest, lemon juice, and salt. Beat in one egg at a time, then add the heavy cream. Beat until smooth.\n\n3. Wrap the bottom of the pan with foil. Pour the prepared filling over the crust, lightly tap on the table to remove air bubbles. Place the pan in a deep baking dish. Pour boiling water into the baking dish to reach halfway up the sides of the pan. Place the cheesecake in the preheated oven for 10-15 minutes. Then reduce the temperature to 110-120 degrees Celsius and bake the cheesecake until set, about 1.5 hours. Remove the pan from the water, leave the cheesecake in the turned-off oven for 20 minutes. Then let the cheesecake cool completely at room temperature. Run a knife around the edges to separate the cheesecake from the sides of the pan. Place the cheesecake in the pan in the refrigerator for several hours (overnight is best). Then carefully remove the pan and serve the cheesecake.",
                cookingTime: "440\nmin",
                calories: "1400\nkcal",
                photo: "classic_cheescake",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }
        
        let categoryBeveragesName = "Beverages"
        if let category = RecipeManager.shared.getCategoryByName(categoryBeveragesName) {
            RecipeManager.shared.createRecipeIfNeeded(
                name: "Mojito",
                ingredients: ["Fresh mint - several leaves", "Lemon - 0.5 piece (or lime)", "Sugar - 1-2 teaspoons", "Ice (crushed or regular)", "Sparkling water."],
                instructions: "1. Crush the mint with sugar to release its juice.\n\n2. Add lemon or lime juice. Crush again until the sugar is completely dissolved.\n\n3. Add ice (more than half a glass) and pour in mineral water. Prepare the cocktail in a glass with a volume of at least 300 ml. Serve the mojito with a straw.",
                cookingTime: "10\nmin",
                calories: "80\nkcal",
                photo: "mojito",
                category: category
            )
        } else {
            print("Category '\(categorySoupName)' not found")
        }

        
        let config = Realm.Configuration(
            schemaVersion: 7,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 7 {
                    
                }
            }
        )
        
        Realm.Configuration.defaultConfiguration = config

        return true
    }
}
