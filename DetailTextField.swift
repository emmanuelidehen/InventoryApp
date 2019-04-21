//
//  DetailTextField.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 4/21/19.
//  Copyright © 2019 Marquavious Draggon. All rights reserved.
//

import UIKit

class DetailTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        borderStyle = .bezel
        
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        borderStyle = .roundedRect
        
        return true
    }
    
}
