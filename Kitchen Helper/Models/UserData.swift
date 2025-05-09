//
//  UserData.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 07/05/2025.
//
import RealmSwift

class UserData: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var email: String = ""
    @Persisted var password: String = ""
}
