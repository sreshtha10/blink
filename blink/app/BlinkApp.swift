//
//  BlinkApp.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//

import SwiftUI

@main
struct BlinkApp: App {
    
    init(){
        let _ = ReminderEngine.shared
    }
    
    var body: some Scene {
        MenuBarExtra{
            MenuBarView()
        } label: {
            Image(systemName: "eye")
        }
        .menuBarExtraStyle(.window)
    }
}
