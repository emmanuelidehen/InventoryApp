//
//  UserService.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 5/23/18.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase


struct UserService {
    
    static func createUser(fullName:String,email:String,password:String, completion: @escaping () -> ()){
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            // If there is an error
            if error != nil {
                print("ERROR SIGNING UP")
                return
            }
            
            // Keys for firebase backen
            let values = ["email":email,"fullname":fullName]
            
            // Make sure a user was made
            guard let uid = user?.uid else { return }
            
            // Grab a datbase ref
            let userRef = Database.database().reference().child("users").child(uid)
            
            // Give the node of the current uid the values we created above
            userRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print("ERROR UPDATING VALUES")
                    return
                }
                completion()
            })
        }
    }
    
    /*
     Here we use completion handlers. For more info on those, check these links
     
     https://youtu.be/v9JtVJUxX7k
     https://youtu.be/HdrIjoTcPEM
     
     */
    
    static func loginUser(email:String,password:String, completion: @escaping () -> ()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            // If there is an error
            if error != nil{
                print("ERROR LOGGING IN")
                return
            }
            completion()
        }
    }
    
    static func sendResetLink(email:String, completion: @escaping () -> ()){
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            // If there is an error
            if error != nil{
                print("ERROR SENDING LINK")
                return
            }
            completion()
        }
    }
    
    
    
//    static func posts(for user: User, completion: @escaping ([Post]) -> Void) {
//        let ref = Database.database().reference().child("posts").child(user.uid)
//
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
//                return completion([])
//            }
//
//            let posts = snapshot.reversed().compactMap(Post.init)
//            completion(posts)
//        })
//    }
    
    
    
    
    
    
    
    
    
}
