import UIKit

class TabBarController: UITabBarController {
    
    let homeController = HomeViewController()
    let favouritesController = FavouritesViewController()
    let listController = ListViewController()
    let randomRecipeController = RandomRecipeViewController()
    


    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor(red: 0.96, green: 0.25, blue: 0.44, alpha: 0.7)
        tabBar.unselectedItemTintColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        
        let shadowPathRect = CGRect(x: 0, y: 0, width: tabBar.bounds.width, height: tabBar.bounds.height)
        tabBar.layer.shadowPath = UIBezierPath(rect: shadowPathRect).cgPath
        tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 6
        
        viewControllers = [
            homeController,
            favouritesController,
            listController,
            randomRecipeController
        ]
        
        homeController.tabBarItem = UITabBarItem(
            title: "Главная",
            image: UIImage(systemName: "house"),
            tag: 0)
        
        favouritesController.tabBarItem = UITabBarItem(
            title: "Избранное",
            image: UIImage(systemName: "heart"),
            tag: 1)
        
        listController.tabBarItem = UITabBarItem(
            title: "Список",
            image: UIImage(systemName: "list.bullet.rectangle.portrait"),
            tag: 2)
        
        randomRecipeController.tabBarItem = UITabBarItem(
            title: "Cлучайный рецепт",
            image: UIImage(systemName: "dice"),
            tag: 2)
    }
}
