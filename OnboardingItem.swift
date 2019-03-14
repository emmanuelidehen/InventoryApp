//
//  OnboardingItem.swift
//  onbaording
//
//
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.
//

import Foundation
import UIKit

class OnboardingItem {
    
    var title: String
    var description: String
    var image: UIImage
    
    init(title:String,description:String,image:UIImage){
        self.title = title
        self.description = description
        self.image = image
    }
}
