//
//  ItemCell.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 4/21/19.
//  Copyright © 2019 Marquavious Draggon. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    //put labels here ===========


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let a = Int(valueLabel.text!.replacingOccurrences(of: "$", with: "")) {
            if a < 50 {
                valueLabel.textColor = UIColor.green
            }
            else {
                valueLabel.textColor = UIColor.red
            }
        }
    }
    
}
