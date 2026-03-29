//
//  BlinkApp.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//

import SwiftUI

@main
struct BlinkApp: App {
    
    var body: some Scene {
        MenuBarExtra("Blink", systemImage: "eye"){
            MenuBarView()
        }
    }
}
