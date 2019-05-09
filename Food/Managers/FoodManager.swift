//
//  FoodManager.swift
//  Food
//
//  Created by Lotanna Igwe-Odunze on 5/6/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

class FoodManager {
    
    static let shared = FoodManager()
    
    //Properties
    
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    var aisle: [Food] = []
    
    var bag: [Food] {
        return aisle.filter { $0.added == true }
    }
    
    
    //Class initialisation using User Defaults.
    let initKey = "foodKey"
    
    private var initCheck: Bool?
    
    init() {
        initCheck = UserDefaults.standard.bool(forKey: initKey)
        
        if initCheck == false {
            
            for item in itemNames {
                if let photo = UIImage(named: item) {
                    
                    let grocery = Food(name: item, imageName: item, added: false, image: photo)
                    
                    aisle.append(grocery)
                }
            }
            
            UserDefaults.standard.set(true, forKey: initKey)
        }
    }
    
}
