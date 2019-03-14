//
//  DisplayNoteViewController.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 5/23/18.
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.
//

import UIKit

// The DisplayNoteViewController references UIViewController built into UIKit
class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) // 1
        noteTitleTextField.text = ""
        noteContentTextView.text = "" }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            // switching save and cancle button
            if identifier == "Save" {
                print("save button tapped")
                
                // this code is iniotially below the save button below
                // chnaged 1 from Let note = Note() to
                
                let note = Note()
                // 2
                note.title = noteTitleTextField.text ?? "";
                note.content = noteContentTextView.text ?? ""
                // 3
                note.modificationTime = Date()
                // newly added to the code 
                _ = segue.destination as! DisplayNoteViewController
            } else if identifier == "Cancle" {
                print("cancle button tapped")

//                // 1
//                let note = Note()
//                // 2
//                note.title = noteTitleTextField.text ?? "";
//                note.content = noteContentTextView.text ?? ""
//                // 3
//                note.modificationTime = Date()
            }
        }
    }






    override func viewDidLoad() {
        super.viewDidLoad()



    }

}


