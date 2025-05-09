//
//  UserDataManager.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 07/05/2025.
//

import Foundation
import RealmSwift
import FirebaseAuth

class UserDataManager {
    static let shared = UserDataManager()
    
    func saveUserToRealm(user: UserData, withUID uid: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let realmUser = UserData()
        realmUser.id = uid
        realmUser.email = user.email
        realmUser.password = user.password
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(realmUser, update: .modified)
            }
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
    
    static func fetchUserData(by uid: String) -> Result<UserData, Error> {
            do {
                let realm = try Realm()
                if let user = realm.object(ofType: UserData.self, forPrimaryKey: uid) {
                    return .success(user)
                } else {
                    return .failure(SignInError.realmUserNotFound)
                }
            } catch {
                return .failure(error)
            }
        }
}
