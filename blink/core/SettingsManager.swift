//
//  SettingsManager.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//
import Foundation
import Combine

class SettingsManager: ObservableObject {
    static let shared = SettingsManager()
    
    @Published var reminderInterval: TimeInterval{
        didSet{
            UserDefaults.standard.set(reminderInterval, forKey: "reminderInterval")
        }
    }
    
    @Published var showFloatingView: Bool {
            didSet { UserDefaults.standard.set(showFloatingView, forKey: "showFloatingView") }
        }
    
    @Published var showSystemNotification: Bool {
            didSet { UserDefaults.standard.set(showSystemNotification, forKey: "showSystemNotification") }
    }
    
    @Published var playSound: Bool {
            didSet { UserDefaults.standard.set(playSound, forKey: "playSound") }
    }
        
    @Published var selectedSound: AlertSound {
            didSet { UserDefaults.standard.set(selectedSound.rawValue, forKey: "selectedSound") }
    }
    
    private init() {
        self.reminderInterval = UserDefaults.standard.double(forKey: "reminderInterval") == 0 ? 20 : UserDefaults.standard.double(forKey: "reminderInterval")
        self.showFloatingView = UserDefaults.standard.bool(forKey: "showFloatingView")
        self.showSystemNotification = UserDefaults.standard.bool(forKey: "showSystemNotification")
        self.playSound = UserDefaults.standard.bool(forKey: "playSound")
                
        let soundStr = UserDefaults.standard.string(forKey: "selectedSound") ?? "Bottle"
        self.selectedSound = AlertSound(rawValue: soundStr) ?? .bottle
    }
}
