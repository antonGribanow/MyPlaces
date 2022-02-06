//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Anton Gribanow on 30/01/2022.
//
import Foundation
import RealmSwift
import UIKit

class Place: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    
        let restaurantNames = [
                "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
                "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
                "Speak Easy", "Morris Pub", "Вкусные истории",
                "Классик", "Love&Life", "Шок", "Бочка"
            ]
    
     func savePlaces() {
        
        for place in restaurantNames {
            
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return } // konwertujemy image na Data
            
            let newPlace = Place()
            
            newPlace.name = place
            newPlace.location = "Warszawa"
            newPlace.type = "restaurant"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
            
        }
        
    
    }
}
