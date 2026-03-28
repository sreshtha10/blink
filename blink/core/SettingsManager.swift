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
    
    private init() {
        self.reminderInterval = UserDefaults.standard.double(forKey: "reminderInterval")
        if reminderInterval == 0{
            self.reminderInterval=20
        }
    }
}
