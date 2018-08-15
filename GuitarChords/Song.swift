//
//  Song.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-12.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// song object with a title, artist and list of chords for each section of the song

import Foundation

class Song {
    
    var title = String()
    var artist = String()
    var capo = String()
    
    var Verse = [String]()
    var PreChorus = [String]()
    var Chorus = [String]()
    var Bridge = [String]()
    
    var Intro = [String]()
    var Outro = [String]()
    var Verse2 = [String]()
    var Verse3 = [String]()
    var Chorus2 = [String]()
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
    
}
