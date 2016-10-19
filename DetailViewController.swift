//
//  DetailViewController.swift
//  StarWarTrek
//
//  Created by Anthony on 10/19/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var starWarsImageView: UIImageView!
    @IBOutlet weak var starTrekImageView: UIImageView!
    
    var starWarsImage: UIImage!
    var starTrekImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starTrekImageView.image = starTrekImage
        starWarsImageView.image = starWarsImage
        
    let views = [starWarsImageView, starTrekImageView]
        for view in views {

            let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragging))
            view?.addGestureRecognizer(gestureRecognizer)
            
            

        }
    }
    
    func dragging(sender: UIPanGestureRecognizer) {
        print("hi")
        let point = sender.location(in: view)
        let draggedView = sender.view!
        draggedView.center = point
        
        if starWarsImageView.frame.intersects(starTrekImageView.frame){
        super.view.backgroundColor = UIColor.red
        }
    }
    
    
}
