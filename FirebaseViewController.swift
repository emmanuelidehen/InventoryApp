//
//  FirebaseViewController.swift
//  onbaording
//
//  Created by Emmanuel Idehen.
//  Copyright © Emmanuel idehen. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirebaseViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        let ref = Database.database().reference().child("randomtext").childByAutoId()
        //creates a ramdom genertated string - AutoId
        
        let values = ["text":textField.text!]
        ref.updateChildValues(values)
    }
    
    
    
}
