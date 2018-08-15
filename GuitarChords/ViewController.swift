//
//  ViewController.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-11.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// shows list of songs by song title and artist name

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var songs = [Song]()
    var selectedIndex = Int()
    
    var songsSortedBy = "Sort By Artist (default)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDemoSongs()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addSong), name: .addSong, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sortBy), name: .sortBy, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteSong), name: .deleteSong, object: nil)
    }
    
    
    @objc func addSong(notification: Notification) {
        let song = notification.object as! Song
        songs.append(song)
        sortSongs()
        tableView.reloadData()
    }
    
    @objc func deleteSong(notification: Notification) {
        let songToDelete = notification.object as! Song
        songs = songs.filter({ $0 !== songToDelete })
        tableView.reloadData()
    }
    
    
    // goes to the ViewSong view when a song is selected in the tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "viewSongSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewSongSegue") {
            let viewSongVC = segue.destination as! ViewSongViewController
            viewSongVC.song = songs[selectedIndex]
        }
    }
    
    
    // tableview functions for songs array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "singleSong")
        cell.textLabel?.text = songs[indexPath.row].title + ", " + songs[indexPath.row].artist
        return cell
    }
    
    
    
    // methods for sorting songs
    @objc func sortBy(notification: Notification) {
        songsSortedBy = notification.object as! String
        sortSongs()
    }
    
    func sortSongs() {
        if (songsSortedBy == "Sort By Artist (default)") {
            songs.sort(by: { $0.artist < $1.artist })
        }
        if (songsSortedBy == "Sort By Song Title") {
            songs.sort(by: { $0.title < $1.title })
        }
        tableView.reloadData()
    }
    
    
    
    // default songs added for demo and testing
    func addDemoSongs() {
        let song1 = Song(title: "Test", artist: "Song")
        song1.Intro = ["A♭", "A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "F#", "G"]
        song1.Verse = ["A♭m", "Am", "B♭m", "Bm", "Cm", "D♭m", "Dm", "E♭m", "Em", "Fm", "F#m", "Gm"]
        song1.Bridge = ["A♭6", "A♭7", "A♭9", "A6", "A7", "A9", "B♭6", "B♭7", "B♭9", "B6", "B7", "B9", "C6", "C7", "C9", "D♭6", "D♭7", "D♭9"]
        song1.Chorus = ["D6", "D7", "D9", "E♭6", "E♭7", "E♭9", "E6", "E7", "E9", "F6", "F7", "F9", "G♭6", "F#7", "F#9", "G6", "G7", "G9",]
        song1.Chorus2 = ["G#m6", "G#m7", "Am6", "Am7", "B♭m6", "B♭m7", "Bm6", "Bm7", "Cm6", "Cm7", "C#m6", "C#m7", "Dm6", "Dm7"]
        song1.Verse2 = ["A♭maj7",  "Amaj7", "B♭maj7", "Bmaj7", "Cmaj7", "D♭maj7", "Dmaj7", "E♭maj7", "Emaj7", "Fmaj7", "G♭maj7", "Gmaj7"]
        song1.Verse3 = ["A♭+", "A+", "B♭+", "B+", "C+", "D♭+", "D+", "E♭+", "E+", "F+", "G♭+", "G+"]
        song1.PreChorus = ["E♭m6", "E♭m7", "Em6", "Em7", "Fm6", "Fm7", "F#m6", "F#m7", "Gm6", "Gm7"]
        song1.Outro = ["G#dim", "Adim", "Bmdim", "Bdim", "Cdim", "C#dim", "Ddim", "E♭dim", "Edim", "Fdim", "F#dim", "Gdim",
                       "A♭sus", "Asus", "B♭sus", "Bsus", "Csus", "D♭sus", "Dsus", "E♭sus", "Esus", "Fsus", "G♭sus", "Gsus"]
        songs.append(song1)
        
        let song2 = Song(title: "All Of Me", artist: "John Legend")
        song2.capo = "1"
        song2.Intro = ["Em", "C", "G", "D"]
        song2.Verse = ["Em", "Cmaj7", "G", "D"]
        song2.PreChorus = ["Am", "G", "D", "A9", "G", "D"]
        song2.Chorus = ["G", "E9", "Am", "C", "D", "Em", "C", "G", "D9"]
        songs.append(song2)
        
        let song3 = Song(title: "Hallelujah", artist: "Jeff Buckley")
        song3.capo = "1"
        song3.Verse = ["C", "Am", "C", "Am", "F", "G", "C", "G", "C", "F", "G", "Am", "F", "G", "E7", "Am"]
        song3.Chorus = ["F", "Am", "F", "C", "G", "C", "G"]
        songs.append(song3)
        
        let song4 = Song(title: "Perfect", artist: "Ed Sheeran")
        song4.capo = "1"
        song4.Intro = ["G"]
        song4.Verse = ["G", "Em", "C", "D"]
        song4.PreChorus = ["G", "Em", "C", "G", "D"]
        song4.Chorus = ["Em", "C", "G", "D"]
        songs.append(song4)
        
        sortSongs()
    }

}

