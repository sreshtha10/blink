//
//  MenuBarView.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//
import SwiftUI
struct MenuBarView: View{
    @ObservedObject var settings = SettingsManager.shared
    
    var body: some View{
        VStack(alignment: .leading, spacing: 12){
            Text("Blink")
                .font(.headline)
            
            Divider()
            
            Text("Interval: \(Int(settings.reminderInterval)) seconds")
            
            Button("Blink Now"){
                NotificationService.shared.sendBlinkNotification()
            }
            
            Divider()
            
            Button("Quit"){
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
        .frame(width: 220)
    }
}
