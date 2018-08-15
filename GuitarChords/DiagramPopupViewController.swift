//
//  DiagramPopupViewController.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-14.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class DiagramPopupViewController: UIViewController {
    
    var chordName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeImage()
    }
   
    // puts the chord diagram in middle of screen
    func placeImage() {
        let imageView = UIImageView(image: UIImage(named: chordName))
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @IBAction func closePopup(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
