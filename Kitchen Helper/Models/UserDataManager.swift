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
    
    func saveUserToRealm(user: UserData, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard !user.id.isEmpty else {
            completion(.failure(NSError(domain: "UserIDError", code: 0, userInfo: [NSLocalizedDescriptionKey: "User ID is not set."])))
            return
        }
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(user, update: .modified)
            }
            completion(.success(true))
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
