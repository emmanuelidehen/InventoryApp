//
//  ListNotesTableViewController.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 5/23/18.
//  Copyright © Emmanuel Idehen. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    
   var notes = [Note] ()
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return notes.count
   }
    

    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath)
        
        // 4
        cell.textLabel?.text = "Yay - it's working!"
        
        // 5
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    
       @IBAction func unwindToListNotesViewController(_ segue: UIStoryboardSegue) {
    
            // for now, simply defining the method is sufficient.
            // we'll add code later
    
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

