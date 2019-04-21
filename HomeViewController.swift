//
//  HomeViewController.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 3/17/19.
//  Copyright © 2019 Emmanuel Idehen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    var posts = [Post]()
 
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
//tableView:numberOfRowsInSection:
    override func viewDidLoad() {
        
      
        super.viewDidLoad()
        
        
//        UserService.posts(for: User.current) { (posts) in
//            self.posts = posts
//            self.tableView.reloadData()
//        }
        

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

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}
