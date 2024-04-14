//
//  PurchaseListManager.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 08/04/2024.
//

import Foundation
import RealmSwift

class PurchaseListManager {
    static let shared = PurchaseListManager()
    
    lazy var realm: Realm = {
        do {
            return try Realm()
        } catch {
            fatalError("Failed to open Realm: \(error)")
        }
    }()
    
    func addPurchase(_ purchase: String) {
        let allPurchases = getAllPurchases()
        
        let newPurchaseList = Purchase()
        newPurchaseList.name = purchase
        
        do {
            try realm.write {
                realm.add(newPurchaseList)
            }
        } catch {
            print("Error adding purchase: \(error)")
        }
    }
    
    
    func deletePurchase(_ purchase: Purchase) {
        do {
            try realm.write {
                realm.delete(purchase)
            }
        } catch {
            print("Error deleting purchase: \(error)")
        }
    }
    
    func getAllPurchases() -> [Purchase] {
        let allPurchases = realm.objects(Purchase.self)
        return Array(allPurchases)
    }
}
