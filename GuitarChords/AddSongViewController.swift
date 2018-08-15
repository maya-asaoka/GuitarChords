//
//  AddChordController.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-12.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class AddSongViewController: UIViewController {
    
    @IBOutlet weak var songTitle: UITextField!
    @IBOutlet weak var artistName: UITextField!
    @IBOutlet weak var capo: UITextField!
    
    @IBOutlet weak var verseText: UILabel!
    @IBOutlet weak var preChorusText: UILabel!
    @IBOutlet weak var chorusText: UILabel!
    @IBOutlet weak var bridgeText: UILabel!
    
    @IBOutlet weak var introText: UILabel!
    @IBOutlet weak var outroText: UILabel!
    @IBOutlet weak var verse2Text: UILabel!
    @IBOutlet weak var verse3Text: UILabel!
    @IBOutlet weak var chorus2Text: UILabel!
    
    var Verse = [String]()
    var PreChorus = [String]()
    var Chorus = [String]()
    var Bridge = [String]()
    
    var Intro = [String]()
    var Outro = [String]()
    var Verse2 = [String]()
    var Verse3 = [String]()
    var Chorus2 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addVerseChord), name: .addVerseChord, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addPreChorusChord), name: .addPreChorusChord, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addChorusChord), name: .addChorusChord, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addBridgeChord), name: .addBridgeChord, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addIntroChord), name: .addIntroChord, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addOutroChord), name: .addOutroChord, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addVerse2Chord), name: .addVerse2Chord, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addVerse3Chord), name: .addVerse3Chord, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addChorus2Chord), name: .addChorus2Chord, object: nil)
    }
    
    // adds song when add button is pressed. error is shown when song title or artist name is empty
    @IBAction func addSong(_ sender: Any) {
        if (songTitle.text!.isEmpty) {
            AlertPopup.showErrorMessage(title: "Error", message: "Please enter a valid song title", vc: self)
        }
        if (artistName.text!.isEmpty) {
            AlertPopup.showErrorMessage(title: "Error", message: "Please enter a valid artist name", vc: self)
        }
        else {
            let newSong = Song(title: songTitle.text!, artist: artistName.text!)
            newSong.capo = capo.text!
            newSong.Verse = Verse
            newSong.PreChorus = PreChorus
            newSong.Chorus = Chorus
            newSong.Bridge = Bridge
            newSong.Intro = Intro
            newSong.Outro = Outro
            newSong.Verse2 = Verse2
            newSong.Verse3 = Verse3
            newSong.Chorus2 = Chorus2
            NotificationCenter.default.post(name: .addSong, object: newSong)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // let ChordPopupViewController know which section we're adding a chord to
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let chordPopupVC = segue.destination as! ChordPopupViewController
        switch (segue.identifier) {
        case "verseSegue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.Verse
        case "preChorusSegue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.PreChorus
        case "chorusSegue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.Chorus
        case "bridgeSegue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.Bridge
        case "introSegue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.Intro
        case "outroSegue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.Outro
        case "verse2Segue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.Verse2
        case "verse3Segue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.Verse3
        case "chorus2Segue":
            chordPopupVC.selected = ChordPopupViewController.Pickers.Chorus2
        default:
            break;
        }
    }
    
    
    // methods to retrieve data from ChordPopupView
    // set text labels in UI to show chord added
    @objc func addVerseChord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        Verse.append(chordPopupVC.chosenChord)
        verseText.text = verseText.text! + "   " + chordPopupVC.chosenChord
    }
    
    @objc func addPreChorusChord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        PreChorus.append(chordPopupVC.chosenChord)
        preChorusText.text = preChorusText.text! + "   " + chordPopupVC.chosenChord
    }
    
    @objc func addChorusChord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        Chorus.append(chordPopupVC.chosenChord)
        chorusText.text = chorusText.text! + "   " + chordPopupVC.chosenChord
    }
    
    @objc func addBridgeChord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        Bridge.append(chordPopupVC.chosenChord)
        bridgeText.text = bridgeText.text! + "   " + chordPopupVC.chosenChord
    }
    
    @objc func addIntroChord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        Intro.append(chordPopupVC.chosenChord)
        introText.text = introText.text! + "   " + chordPopupVC.chosenChord
    }
    
    @objc func addOutroChord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        Outro.append(chordPopupVC.chosenChord)
        outroText.text = outroText.text! + "   " + chordPopupVC.chosenChord
    }
    
    @objc func addVerse2Chord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        Verse2.append(chordPopupVC.chosenChord)
        verse2Text.text = verse2Text.text! + "   " + chordPopupVC.chosenChord
    }
    
    @objc func addVerse3Chord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        Verse3.append(chordPopupVC.chosenChord)
        verse3Text.text = verse3Text.text! + "   " + chordPopupVC.chosenChord
    }
    
    @objc func addChorus2Chord(notification: Notification) {
        let chordPopupVC = notification.object as! ChordPopupViewController
        Chorus2.append(chordPopupVC.chosenChord)
        chorus2Text.text = chorus2Text.text! + "   " + chordPopupVC.chosenChord
    }

    
    
    
}
