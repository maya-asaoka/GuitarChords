//
//  Chords.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-12.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// all the chords supported on app

import Foundation

struct Chords {
    
    let majorChordsBasic = ["A♭", "A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "F#", "G"]
    let minorChordsBasic = ["A♭m", "Am", "B♭m", "Bm", "Cm", "D♭m", "Dm", "E♭m", "Em", "Fm", "F#m", "Gm"]
    
    
    let majorChords679 = ["A♭6", "A♭7", "A♭9", "A6", "A7", "A9", "B♭6", "B♭7", "B♭9", "B6", "B7", "B9", "C6", "C7", "C9", "D♭6", "D♭7", "D♭9",
                          "D6", "D7", "D9", "E♭6", "E♭7", "E♭9", "E6", "E7", "E9", "F6", "F7", "F9", "G♭6", "F#7", "F#9", "G6", "G7", "G9",]
    let majorChordsMaj7 = ["A♭maj7",  "Amaj7", "B♭maj7", "Bmaj7", "Cmaj7", "D♭maj7", "Dmaj7", "E♭maj7", "Emaj7", "Fmaj7", "G♭maj7", "Gmaj7"]
    let majorChordsPlus = ["A♭+", "A+", "B♭+", "B+", "C+", "D♭+", "D+", "E♭+", "E+", "F+", "G♭+", "G+"]
    
    
    let minorChords67 = ["G#m6", "G#m7", "Am6", "Am7", "B♭m6", "B♭m7", "Bm6", "Bm7", "Cm6", "Cm7", "C#m6", "C#m7", "Dm6", "Dm7",
                         "E♭m6", "E♭m7", "Em6", "Em7", "Fm6", "Fm7", "F#m6", "F#m7", "Gm6", "Gm7"]
    
    let diminishedChords = ["G#dim", "Adim", "Bmdim", "Bdim", "Cdim", "C#dim", "Ddim", "E♭dim", "Edim", "Fdim", "F#dim", "Gdim"]
    let suspendedChords = ["A♭sus", "Asus", "B♭sus", "Bsus", "Csus", "D♭sus", "Dsus", "E♭sus", "Esus", "Fsus", "G♭sus", "Gsus"]
    
    
    // picker options for chordpopup
    static let chordPicker1 = ["A♭", "A", "B♭", "B", "C", "D♭", "D", "E♭", "E", "F", "F#", "G"]
    static let chordPicker2 = ["", "m", "6", "7", "9", "maj7", "+", "m6", "m7", "dim", "sus"]
    
}
