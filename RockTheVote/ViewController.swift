//
//  ViewController.swift
//  RockTheVote
//
//  Created by Smith, Stephen Christopher on 12/12/19.
//  Copyright © 2019 Smith, Stephen Christopher. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // create a reference to a Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var vote = [Vote] ()

    
    @IBOutlet weak var songTextField: UITextField!
    
    @IBOutlet weak var voterTextField: UITextField!
    
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var dislikeButton: UIButton!
    

    @IBAction func songTextFieldEditingDidChange(_ sender: UITextField) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        likeButton.isEnabled = false
        dislikeButton.isEnabled = false
        
        if let song = songTextField.text, let voter = voterTextField.text {
            let trimmedSong = song.trimmingCharacters(in: .whitespaces)
            let trimmedVoter = voter.trimmingCharacters(in: .whitespaces)
            
            if (!trimmedSong.isEmpty && !trimmedVoter.isEmpty){
                likeButton.isEnabled = true
                dislikeButton.isEnabled = true
            }
        }
    }

    func saveVote()  {
        do {
            try context.save()
        } catch {
            print("Error saving votes to CoreData")
        }
    }
}

