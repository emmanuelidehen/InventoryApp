//
//  LoginViewController.swift
//  onbaording
//
//  Created by emmmanuel idehen on 7/10/18.
//  Copyright © Emmanuel idehen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        
        // If there is text in the email textfield if not, return the function
        guard let email = emailTextField.text, !email.isEmpty else {
            return
        }
        
        // If there is text in the passwordTextField if not, return the function
        guard let password = passwordTextField.text, !password.isEmpty else {
            return
        }

        UserService.loginUser(email: email, password: password){
            // store user information after login button pressed
            
            // When all is done
            self.performSegue(withIdentifier: "signInFromLogin", sender: self)
            
                       
        }
    }

    @IBAction func exitButtonPressed(_ sender: Any) {
        
        // Dissmiss screen
        self.dismiss(animated: true, completion: nil)
    }

}
