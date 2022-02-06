//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Anton Gribanow on 06/02/2022.
//

import RealmSwift

let realm = try! Realm() // Tworzymy Realm object, który będzie dawał dostęp do DB.

class StorageManager {
    
    static func saveObject(_ place: Place){     //dodajemy object place do realm DB
        
        try! realm.write {
            realm.add(place)
        }
    }
    
}
