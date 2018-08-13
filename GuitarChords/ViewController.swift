//
//  ViewController.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-11.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(addSong), name: .addSong, object: nil)
    }
    
    @objc func addSong(notification: Notification) {
        let song = notification.object as! Song
        songs.append(song)
        tableView.reloadData()
    }
    
    
    // functions for displaying array of songs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "singleSong")
        cell.textLabel?.text = songs[indexPath.row].title + ", " + songs[indexPath.row].artist
        return cell
    }

}

