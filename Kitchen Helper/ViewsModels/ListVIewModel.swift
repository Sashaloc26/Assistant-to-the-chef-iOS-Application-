//
//  ListVIewModel.swift
//  Kitchen Helper
//
//  Created by Саша Тихонов on 10/04/2024.
//

import Foundation
import RealmSwift


class ListViewModel {
    
    var purchaseList: [Purchase] = []
    
    func getPurchaseList(completion: @escaping () -> Void) {
        self.purchaseList = PurchaseListManager.shared.getAllPurchases()
        print(purchaseList.count)
        completion()
    }
    
    func addPurchase(purchase: String) {
        PurchaseListManager.shared.addPurchase(purchase)

        getPurchaseList() {}
    }
}


