//
//  AppDelegate.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 20/01/2024.
//

import UIKit
import RealmSwift
import Firebase
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var currentUserId: String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        if let user = Auth.auth().currentUser {
            currentUserId = user.uid
        } else {
            print("Пользователь НЕ залогинен")
        }
        print("Current User ID \(currentUserId ?? "")")
        
        if let currentUser = Auth.auth().currentUser {
            RecipeManager.shared.initializeDefaultData(for: currentUser.uid)
            print("Current User ID \(currentUserId ?? "")")
            
        }
        if let currentUserId = currentUserId {
            RecipeManager.shared.updateOwnerIdForAllRecipesIfNeeded(currentUserId: currentUserId)
        }
        
        let config = Realm.Configuration(
            schemaVersion: 10,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 10 {
                    
                }
            }
        )
        
        Realm.Configuration.defaultConfiguration = config
        
        return true
    }
}
