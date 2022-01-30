//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Anton Gribanow on 30/01/2022.
//

import Foundation

struct Place {
    
    var name: String
    var location: String
    var type: String
    var image: String
    
       static let restaurantNames = [
                "Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
                "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
                "Speak Easy", "Morris Pub", "Вкусные истории",
                "Классик", "Love&Life", "Шок", "Бочка"
            ]
    
    static func getPlaces() -> [Place] {
            
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "Warszawa", type: "Restaran", image: place))
        }
        
        return places
    }
}
