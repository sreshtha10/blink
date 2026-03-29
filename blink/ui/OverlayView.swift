//
//  OverlayView.swift
//  blink
//
//  Created by Sreshtha Mehrotra on 29/03/26.
//
import SwiftUI
struct OverlayView: View {
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(radius: 20)
            
            Text("BLINK 👀")
                .font(.system(size: 36, weight: .bold))
                .padding()
        }
        .frame(width: 300, height: 120)
    }
}
