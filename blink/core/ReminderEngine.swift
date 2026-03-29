//
//  ReminderEngine.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//

import Foundation
import Combine

final class ReminderEngine: ObservableObject {
    
    static let shared = ReminderEngine()
    
    private var timerCancellable: AnyCancellable?
    private var settings = SettingsManager.shared
    
    private var cancellables: Set<AnyCancellable> = []
    
    private init() {
        observeSettings()
        startTimer()
    }
    
    
    private func observeSettings() {
        settings.$reminderInterval.sink{
            [weak self] _ in self?.restartTimer()
        }.store(in: &cancellables)
    }
    
    private func startTimer(){
        timerCancellable = Timer
            .publish(every: settings.reminderInterval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.triggerReminder()
            }
    }
    
    private func restartTimer(){
        timerCancellable?.cancel()
        startTimer()
    }
    
    private func triggerReminder() {
        
        if settings.showSystemNotification {
            NotificationService.shared.sendBlinkNotification()
        }
            
        if settings.showFloatingView {
            FloatingWindowService.shared.showBlinkOverlay()
            print("Show floating")
        }
            
        if settings.playSound {
            SoundService.shared.play(settings.selectedSound)
        }
        
        print("Reminder Triggered")
    }
}
