//
//  SceneDelegate.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 20/01/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?   
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let authViewController = AuthViewController()
        let navController = UINavigationController(rootViewController: authViewController)

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}

