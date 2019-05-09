//
//  FoodListController.swift
//  Food
//
//  Created by Lotanna Igwe-Odunze on 5/6/19.
//  Copyright © 2019 Lotanna Odunze. All rights reserved.
//

import UIKit

class FoodListController: UICollectionViewController {
    
    //Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotifMgr.shared.checkPermission { (status) in
            if status == .notDetermined {
                NotifMgr.shared.askPermission(completion: { (approved) in
                    if approved == true { print("Yayyyyyyy")
                    } else { print("Boooooooo") }
                })
            }
        }
        
        collectionView.reloadData()
    }
    
    //Properties
    
    //Datasource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodManager.shared.aisle.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCellController
        
        cell.nameLabel.text = FoodManager.shared.aisle[indexPath.row].name
        cell.statusLabel.text = FoodManager.shared.aisle[indexPath.row].added ? "Added" : "Not Added"
        cell.foodImgView.image = FoodManager.shared.aisle[indexPath.row].image

        print("WTFFFFFFF")
        return cell
    }
    
  /*
    //Delegate Methods
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        FoodManager.shared.aisle[indexPath.row].added.toggle()
    }
*/

}
