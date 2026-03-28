//
//  NotificationService.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//
import Foundation
import UserNotifications

final class NotificationService{
    
    static let shared = NotificationService()
    
    private init(){
        requestPermission()
    }
    
    private func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound]) { granted, error in
                if granted {
                    print("Notification permission granted")
                } else {
                    print("Notification permission denied")
                }
                
                if let error = error {
                    print("Permission error:", error)
                }
            }
    }
    
    func sendBlinkNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Blink Reminder!"
        content.body="Take a second and blink your eyes 👀"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error adding notification:", error)
            }
        }
    }
}
