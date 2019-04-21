//
//  ListNotesTableViewCell.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 3/15/19.
//  Copyright © 2019 Emmanuel Idehen. All rights reserved.
//

import UIKit

class ListNotesTableViewCell: UITableViewCell
{

   
    @IBOutlet weak var noteTitleLabel: UILabel!
    
   
    @IBOutlet weak var noteModificationTimeLabel: UILabel!
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
