//
//  ViewSongViewController.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-14.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class ViewSongViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var song = Song(title: "", artist: "")
    var index = Int()
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var songTitleText: UILabel!
    @IBOutlet weak var artistNameText: UILabel!
    @IBOutlet weak var capoPosText: UILabel!
    
    var chordView = [String]()
    var chordArrays = [[String]]()
    
    override func viewDidLoad() {
        songTitleText.text = song.title
        artistNameText.text = song.artist
        capoPosText.text = "Capo: " + song.capo
        if (song.capo.isEmpty) {
            capoPosText.text = ""
        }
        formatChords()
    }
    
    
    // user has selected to delete song -> show confirmation popup
    @IBAction func deleteSong(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Song?", message: "This cannot be undone", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in self.popupHandler(alert: alert)}))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in alert.dismiss(animated: true)}))
        self.present(alert, animated: true, completion: nil)
    }
    
    // handler for if confirm yes is pressed
    func popupHandler(alert: UIAlertController) {
        NotificationCenter.default.post(name: .deleteSong, object: self.song)
        alert.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "showChordsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showChordsSegue") {
            let chordsViewVC = segue.destination as! ChordsViewViewController
            chordsViewVC.chords = chordArrays[index]
        }
    }

    
    // functions for displaying chords
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chordView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "singleSong")
        cell.textLabel?.text = chordView[indexPath.row]
        return cell
    }
    
    // add chords for each section of song (if any)
    func formatChords() {
        if (song.Intro.count != 0) {
            let chordString = "Intro: " + song.Intro.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.Intro)
        }
        if (song.Verse.count != 0) {
            let chordString = "Verse: " + song.Verse.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.Verse)
        }
        if (song.Verse2.count != 0) {
            let chordString = "Verse 2: " + song.Verse2.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.Verse2)
        }
        if (song.PreChorus.count != 0) {
            let chordString = "Pre-Chorus: " + song.PreChorus.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.PreChorus)
        }
        if (song.Chorus.count != 0) {
            let chordString = "Chorus: " + song.Chorus.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.Chorus)
        }
        if (song.Verse3.count != 0) {
            let chordString = "Verse 3: " + song.Verse3.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.Verse3)
        }
        if (song.Chorus2.count != 0) {
            let chordString = "Chorus 2: " + song.Chorus2.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.Chorus2)
        }
        if (song.Bridge.count != 0) {
            let chordString = "Bridge: " + song.Bridge.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.Bridge)
        }
        if (song.Outro.count != 0) {
            let chordString = "Outro: " + song.Outro.joined(separator: ", ")
            chordView.append(chordString)
            chordArrays.append(song.Outro)
        }
        tableView.reloadData()
    }
    
}
