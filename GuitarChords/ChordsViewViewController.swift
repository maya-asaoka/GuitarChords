//
//  ChordsViewViewController.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-14.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class ChordsViewViewController: UIViewController {
    
    var chords = [String]()
    var selectedChord = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpChordButtons()
    }
    
    // create a button for each chord in chords
    func setUpChordButtons() {
        var xValue = 15
        var yValue = 100
        for chord in chords {
            if (xValue > Int(view.frame.size.width - 100)) {
                yValue = yValue + 50
                xValue = 15
            }
            let button = UIButton.init(type: .system)
            button.frame = CGRect(x: xValue, y: yValue, width: 100, height: 40)
            button.setTitle(chord, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            self.view.addSubview(button)
            xValue = xValue + 100
        }
    }
    
    @objc func buttonPressed(sender: UIButton) {
        selectedChord = sender.titleLabel!.text!
        performSegue(withIdentifier: "showDiagramSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDiagramSegue") {
            let diagramPopupVC = segue.destination as! DiagramPopupViewController
            diagramPopupVC.chordName = selectedChord
        }
    }
    
}
