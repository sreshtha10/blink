//
//  AlertSound.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//
enum AlertSound: String, CaseIterable, Identifiable {
    case bottle = "Bottle"
    case funk = "Funk"
    case morse = "Morse"
    case purr = "Purr"
    case tink = "Tink"
        
    var id: String { self.rawValue }
}
