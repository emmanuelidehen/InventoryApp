//
//  ForgotPasswordViewController.swift
//  onbaording
//
//  Created by Emmanuel on 5/23/18.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.alpha = 0 // Make sure our activity indicator is invisible
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        
        // Dismiss View
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendResetLinkButtonPressed(_ sender: Any) {
        
        activityIndicator.alpha = 1 // Make sure our activity indicator is visible
        activityIndicator.startAnimating() // Animate
        
         // If there is text in the email textfield if not, return the function
        guard let email = emailTextField.text, !email.isEmpty else {
            return
        }
        
        UserService.sendResetLink(email: email) {
            
            // When its done
            self.activityIndicator.stopAnimating() // Stop animation
            self.activityIndicator.alpha = 0 // Make it invisible
            
            // Create alert
            let alert = UIAlertController(title: "Email Sent", message: "An email was sent to  \(email). Please check ect.", preferredStyle: .alert)
            
            // Present alert
            self.present(alert, animated: true)
            
            // Add a button to alert
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        }
    }
}
