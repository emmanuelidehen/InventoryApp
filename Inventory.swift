//
//  Inventory.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 4/1/19.
//  Copyright © 2019 Emmanuel Idehen . All rights reserved.
//

import Foundation

class Inventory{
    
  //  public:
    var quantity: Int
    var productName: String
    var notes: String?
    
    
 //   Initialisation
    
    init(quantity: Int, product: String, notes: String?) {
        self.quantity = quantity
        self.quantity = quantity
        self.productName = product
        self.notes = notes
    }
    
}
