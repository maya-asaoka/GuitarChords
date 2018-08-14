//
//  NotificationNameExtension.swift
//  GuitarChords
//
//  Created by Maya Asaoka on 2018-08-12.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let addSong = Notification.Name(rawValue: "addSong")
    
    static let viewSong = Notification.Name(rawValue: "viewSong")
    
    static let addVerseChord = Notification.Name(rawValue: "addVerseChord")
    static let addPreChorusChord = Notification.Name(rawValue: "addPreChorusChord")
    static let addChorusChord = Notification.Name(rawValue: "addChorusChord")
    static let addBridgeChord = Notification.Name(rawValue: "addBridgeChord")
    
    static let addIntroChord = Notification.Name(rawValue: "addIntroChord")
    static let addOutroChord = Notification.Name(rawValue: "addOutroChord")
    static let addVerse2Chord = Notification.Name(rawValue: "addVerse2Chord")
    static let addVerse3Chord = Notification.Name(rawValue: "addVerse3Chord")
    static let addChorus2Chord = Notification.Name(rawValue: "addChorus2Chord")
    
}
