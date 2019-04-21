//
//  ListNotesTableViewController.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 3/15/19.
//
//

import UIKit

class ListNotesTableViewController: UIViewController {
    
    
   

    override func viewDidLoad() {
        
          super.viewDidLoad()
        
          // Do any additional setup after loading the view.
        
    }
 
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 10
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
      cell.noteTitleLabel.text = "note's title"
       cell.noteModificationTimeLabel.text = "note's modification time"
        
        return cell
    }
   
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        // 1
        guard let identifier = segue.identifier else { return }

        // Pass the selected object to the new view controller.


        // 2
        if identifier == "displayNote"
        {
            print("Transitioning to the Display Note View Controller")
        }

    }
    

}
