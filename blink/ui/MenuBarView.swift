//
//  MenuBarView.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//
import SwiftUI

struct MenuBarView: View {
    @ObservedObject var settings = SettingsManager.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Blink Settings")
                .font(.headline)
            
            // 1. Timer Interval
            VStack(alignment: .leading, spacing: 4) {
                Text("Reminder Frequency")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Stepper("\(Int(settings.reminderInterval)) seconds",
                        value: $settings.reminderInterval,
                        in: 5...300,
                        step: 5)
            }
            
            Divider()
            
            // 2. Notification Methods
            VStack(alignment: .leading, spacing: 8) {
                Text("Alert Methods")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Toggle("Floating Overlay", isOn: $settings.showFloatingView)
                Toggle("System Notification", isOn: $settings.showSystemNotification)
            }
            
            Divider()
            
            // 3. Sound Settings
            VStack(alignment: .leading, spacing: 8) {
                Toggle("Enable Sound", isOn: $settings.playSound)
                
                if settings.playSound {
                    Picker("Alert Sound", selection: $settings.selectedSound) {
                        ForEach(AlertSound.allCases) { sound in
                            Text(sound.rawValue).tag(sound)
                        }
                    }
                    .pickerStyle(.menu)
                    // Added a button to test the sound immediately
                    Button(action: { SoundService.shared.play(settings.selectedSound) }) {
                        Label("Test Sound", systemImage: "play.circle")
                    }
                    .buttonStyle(.link)
                    .font(.caption)
                }
            }
            
            Divider()
            
            // 4. Footer Actions
            HStack {
                Button(action: { NotificationService.shared.sendBlinkNotification() }) {
                    Label("Blink Now", systemImage: "eye.fill")
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Quit") {
                    NSApplication.shared.terminate(nil)
                }
                .buttonStyle(.plain)
                .foregroundColor(.red)
            }
        }
        .padding()
        .frame(width: 260)
    }
}
