//
//  MainTabBarController.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 3/17/19.
//  Copyright © 2019 Emmanuel Idehen. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    //Mark
      let photoHelper = MGPhotoHelper()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        photoHelper.completionHandler = { image in
           PostService.create(for: image)
        }
        // 1
        delegate = self as? UITabBarControllerDelegate
        // 2
        tabBar.unselectedItemTintColor = .black

        // Do any additional setup after loading the view.
        
    }
    
   

    /*
    // MARK: - Navigation
     
    
     
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
 
    
  
 }
//i was supposed to put this but forcing to unrap the delegate took the error away!

//extension MainTabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        return true
//    }
//}


extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            // present photo taking action sheet
           //print("take photo")
            photoHelper.presentActionSheet(from: self)
            
            return false
        } else {
            return true
        }
    }
}
