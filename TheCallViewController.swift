//
//  TheCallViewController.swift
//  onbaording
//
//  Created by Emmanuel Idehen on 5/24/18.
//  Copyright © Emmanuel idehen. All rights reserved.
//

import UIKit
import AVFoundation

class TheCallViewController: UIViewController {
    var player: AVAudioPlayer?
    func playSound(){
        guard let url = Bundle.main.url(forResource: " ", withExtension: "mp3")
            else {return}
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player
                else {return}
            player.play()
            }
        catch let error {
            print (error.localizedDescription)
            
        }
        
    }

    @IBAction func callingButtonPressed(_ sender: Any) {
        playSound()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
