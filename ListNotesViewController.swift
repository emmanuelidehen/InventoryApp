//
//  ListNotesViewController.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 3/14/19.
//  Copyright © 2019 Marquavious Draggon. All rights reserved.
//
import UIKit
import Foundation

class ListNotesTableViewController: UITableViewController {
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 10
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        cell.noteTitleLabel.text = "note's title"
        cell.noteModificationTimeLabel.text = "note's modification time"
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
}




//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    // 2
//    let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath)
//    cell.textLabel?.text = "Cell Row: \(indexPath.row) Section: \(indexPath.section)"
//
//    return cell
//}
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//{
//    let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
//    cell.noteTitleLabel.text = "note's title"
//    cell.noteModificationTimeLabel.text = "note's modification time"
//
//    return cell
//}
//func tableView(_ tableView: UITableView, numberOfRowsInSection Section: Int)-> Int
//{
//
//}
