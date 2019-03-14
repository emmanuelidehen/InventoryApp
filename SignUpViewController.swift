//
//  SignUpViewController.swift
//  onbaording
//
//  Created by Emmanuel on 7/10/17.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.
//

import UIKit
import FirebaseAuth


class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        // If there is text in the email textfield if not, return the function
        guard let email = emailTextfield.text, !email.isEmpty else {
            return
        }
        // If there is text in the fullName if not, return the function
        guard let fullName = fullNameTextField.text, !fullName.isEmpty else {
            return
        }
        // If there is text in the passwordTextField if not, return the function
        guard let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        
        
        

        // Create User
        UserService.createUser(fullName: fullName, email: email, password: password) {
             // When all is done
             self.performSegue(withIdentifier: "openSignedVC", sender: self)
            //self.performSegue(withIdentifier: "signIn", sender: self)
        }
       // performSegue(withIdentifier: "openSignedVC", sender: self)
        
        
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        // Dissmis view
        self.dismiss(animated: true, completion: nil)
    }

    
    
}
