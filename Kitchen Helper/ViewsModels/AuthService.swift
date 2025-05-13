//
//  AuthService.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 07/05/2025.
//

import Foundation
import FirebaseAuth
import RealmSwift

enum SignInError: Error {
    case invalidUser
    case emailIsNotVerified
    case realmUserNotFound
}

class AuthService {
    
    static let shared = AuthService()

    let userDataManager = UserDataManager()
    
    func createNewUser(user: UserData, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let firebaseUID = result?.user.uid else {
                completion(.failure(NSError(domain: "UIDError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No UID from Firebase"])))
                return
            }
            
            user.id = firebaseUID
            userDataManager.saveUserToRealm(user: user) { saveResult in
                switch saveResult {
                case .success:
                    result?.user.sendEmailVerification(completion: nil)
                    self.signOut()
                    completion(.success(true))
                case .failure(let saveError):
                    completion(.failure(saveError))
                }
            }
        }
    }
    
    func signIn(user: UserData, completion: @escaping (Result<UserData, Error>) -> Void) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
            if let error = error {
                print("Firebase Auth Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            guard let firebaseUser = result?.user else {
                completion(.failure(SignInError.invalidUser))
                return
            }

            if !firebaseUser.isEmailVerified {
                completion(.failure(SignInError.emailIsNotVerified))
                return
            }

            let realmResult = UserDataManager.fetchUserData(by: firebaseUser.uid)

            switch realmResult {
            case .success(let localUser):
                completion(.success(localUser))
            case .failure:
                let recoveredUser = UserData()
                recoveredUser.id = firebaseUser.uid
                recoveredUser.email = firebaseUser.email ?? ""
                recoveredUser.password = ""

                let manager = UserDataManager()
                manager.saveUserToRealm(user: recoveredUser) { saveResult in
                    switch saveResult {
                    case .success:
                        completion(.success(recoveredUser))
                    case .failure(let saveError):
                        completion(.failure(saveError))
                    }
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
