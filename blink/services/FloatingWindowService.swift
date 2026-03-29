//
//  FloatingWindowService.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//
import SwiftUI
import AppKit

final class FloatingWindowService{
    
    static let shared = FloatingWindowService()
    
    private var window: NSWindow?
    
    private init(){}
    
    func showBlinkOverlay(){
        if window == nil{
            createWindow()
        }
        
        guard let window else { return }
        
        window.alphaValue=0
        window.orderFrontRegardless()
        
        //fade in
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.3
            window.animator().alphaValue = 1
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.hideOverlay()
        }
        
    }
    
    private func hideOverlay(){
        guard let window else { return }
        
        NSAnimationContext.runAnimationGroup{ context in
            context.duration = 0.3
            window.animator().alphaValue = 0
        } completionHandler: {
            window.orderOut(nil)
        }
    }
    
    private func createWindow(){
        
        let contentView = NSHostingView(rootView: OverlayView())
        
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 120),
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        
        guard let window else { return }
                
        window.center()
        window.isOpaque = false
        window.backgroundColor = .clear
        window.level = .mainMenu+1
        window.ignoresMouseEvents = true
        window.collectionBehavior = [
            .canJoinAllSpaces,
            .fullScreenAuxiliary
        ]
                
        window.contentView = contentView
    }
}
