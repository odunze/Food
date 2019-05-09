//
//  CartViewController.swift
//  Food
//
//  Created by Lotanna Igwe-Odunze on 5/6/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayInformation()
    }


//Outlets
@IBOutlet weak var messageLabel: UILabel!


//Functions
func displayInformation() {
    
    let x = FoodManager.shared.bag.count
    messageLabel.text = "You have selected \(x) item(s)."
    
}

//Actions
}
