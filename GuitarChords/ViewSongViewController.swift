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
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var songTitleText: UILabel!
    @IBOutlet weak var artistNameText: UILabel!
    
    var chordView = [String]()
    
    override func viewDidLoad() {
        songTitleText.text = song.title
        artistNameText.text = song.artist
        formatChords()
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
        }
        if (song.Verse.count != 0) {
            let chordString = "Verse: " + song.Verse.joined(separator: ", ")
            chordView.append(chordString)
        }
        if (song.Verse2.count != 0) {
            let chordString = "Verse 2: " + song.Verse2.joined(separator: ", ")
            chordView.append(chordString)
        }
        if (song.PreChorus.count != 0) {
            let chordString = "Pre-Chorus: " + song.PreChorus.joined(separator: ", ")
            chordView.append(chordString)
        }
        if (song.Chorus.count != 0) {
            let chordString = "Chorus: " + song.Chorus.joined(separator: ", ")
            chordView.append(chordString)
        }
        if (song.Verse3.count != 0) {
            let chordString = "Verse 3: " + song.Verse3.joined(separator: ", ")
            chordView.append(chordString)
        }
        if (song.Chorus2.count != 0) {
            let chordString = "Chorus 2: " + song.Chorus2.joined(separator: ", ")
            chordView.append(chordString)
        }
        if (song.Bridge.count != 0) {
            let chordString = "Bridge: " + song.Bridge.joined(separator: ", ")
            chordView.append(chordString)
        }
        if (song.Outro.count != 0) {
            let chordString = "Outro: " + song.Outro.joined(separator: ", ")
            chordView.append(chordString)
        }
        tableView.reloadData()
    }
    
}
