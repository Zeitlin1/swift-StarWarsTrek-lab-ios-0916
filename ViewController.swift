//
//  ViewController.swift
//  StarWarTrek
//
//  Created by James Campagno on 10/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var starWars1: UIImageView!
    @IBOutlet weak var starWars2: UIImageView!
    @IBOutlet weak var starWars3: UIImageView!
    @IBOutlet weak var starWars4: UIImageView!
    
    @IBOutlet weak var starTrek1: UIImageView!
    @IBOutlet weak var starTrek2: UIImageView!
    @IBOutlet weak var starTrek3: UIImageView!
    @IBOutlet weak var starTrek4: UIImageView!
    
    var starWarsCharacter: UIImageView!
    var starTrekCharacter: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStarTrekGestureRecognizers()
        setupStarWarsGestureRecognizers()
        
    }
    
    func setupStarWarsGestureRecognizers() {
        let imageViews = [starWars1, starWars2, starWars3, starWars4]
        for i in imageViews {
            
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(starWarsCharcterChosen))
            gestureRecognizer.numberOfTapsRequired = 1
            
            i?.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    func setupStarTrekGestureRecognizers() {
        let imageViews = [starTrek1, starTrek2, starTrek3, starTrek4]
        for i in imageViews {
            
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(starTrekCharcterChosen))
            gestureRecognizer.numberOfTapsRequired = 1
            
            i?.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    func starWarsCharcterChosen(_ sender: UITapGestureRecognizer){
        if starWarsCharacter != nil { starWarsCharacter.layer.borderWidth = 0.0 }
        let chosenImageView = sender.view as! UIImageView
        
        chosenImageView.layer.borderColor = UIColor.green.cgColor
        chosenImageView.layer.borderWidth = 2.0
        starWarsCharacter = chosenImageView
        checkForFight()
        
    }
    
    func starTrekCharcterChosen(_ sender: UITapGestureRecognizer){
        if starTrekCharacter != nil { starTrekCharacter.layer.borderWidth = 0.0 }
        let chosenImageView = sender.view as! UIImageView
        
        chosenImageView.layer.borderColor = UIColor.green.cgColor
        chosenImageView.layer.borderWidth = 2.0
        starTrekCharacter = chosenImageView
        checkForFight()
    }
    
    
    func checkForFight() {
        if starWarsCharacter != nil && starTrekCharacter != nil {
        performSegue(withIdentifier: "fightSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare fired")
        if segue.identifier == "fightSegue" {
            if let dest = segue.destination as? DetailViewController {
                dest.starTrekImage = starTrekCharacter.image
                dest.starWarsImage = starWarsCharacter.image
                
                
            }
        }
    }
    
}


