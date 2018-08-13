//
//  ChordPopupController.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-12.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class ChordPopupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    enum Pickers {
        case Verse
        case PreChorus
        case Chorus
        case Bridge
        case Intro
        case Outro
        case Verse2
        case Verse3
        case Chorus2
    }
    
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!
    
    var selected = Pickers.Verse
    
    var chosenChord = String()
    
    @IBAction func addChord(_ sender: Any) {
        chosenChord = Chords.chordPicker1[picker1.selectedRow(inComponent: 0)] + Chords.chordPicker2[picker2.selectedRow(inComponent: 0)]
        
        switch (selected) {
        case Pickers.Verse:
            NotificationCenter.default.post(name: .addVerseChord, object: self)
        case Pickers.PreChorus:
            NotificationCenter.default.post(name: .addPreChorusChord, object: self)
        case Pickers.Chorus:
            NotificationCenter.default.post(name: .addChorusChord, object: self)
        case Pickers.Bridge:
            NotificationCenter.default.post(name: .addBridgeChord, object: self)
        case Pickers.Intro:
            NotificationCenter.default.post(name: .addIntroChord, object: self)
        case Pickers.Outro:
            NotificationCenter.default.post(name: .addOutroChord, object: self)
        case Pickers.Verse2:
            NotificationCenter.default.post(name: .addVerse2Chord, object: self)
        case Pickers.Verse3:
            NotificationCenter.default.post(name: .addVerse3Chord, object: self)
        case Pickers.Chorus2:
            NotificationCenter.default.post(name: .addChorus2Chord, object: self)
        }
        self.dismiss(animated: true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1) {
            return Chords.chordPicker1.count
        }
        else {
            return Chords.chordPicker2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1) {
            return Chords.chordPicker1[row]
        }
        else {
            return Chords.chordPicker2[row]
        }
    }
    
    
    
    
}
