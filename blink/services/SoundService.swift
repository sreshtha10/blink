//
//  SoundService.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//
import Foundation
import AppKit

final class SoundService {
    
    static let shared = SoundService()
    
    private init() {}
    
    func play(_ sound: AlertSound){
        
        guard let nsSound = NSSound(named: sound.rawValue) else{
            print("Failed to find sound: \(sound.rawValue)")
            return
        }
        
        if nsSound.isPlaying {
            nsSound.stop()
        }
        
        nsSound.play()
    }
}
