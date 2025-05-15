//
//  SceneDelegate.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 20/01/2024.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        if Auth.auth().currentUser != nil {
            let tabBarController = TabBarController()
            window?.rootViewController = tabBarController
            window?.makeKeyAndVisible()

            UIView.transition(with: window!,
                              duration: 0.4,
                              options: .transitionFlipFromRight,
                              animations: nil,
                              completion: nil)
        } else {
            let authVC = AuthViewController()
            let navController = UINavigationController(rootViewController: authVC)
            window?.rootViewController = navController
            window?.makeKeyAndVisible()
        }
    }
}
