//
//  ContentView.swift
//  watchOS-Practice Watch App
//
//  Created by Takasur Azeem on 24/03/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var sentance = EmojiSentence()
    
    var body: some View {
        VStack {
            Image("Cookie")
                .resizable()
                .scaledToFit()
                .overlay {
                    Text(sentance.emoji)
                        .font(.title3)
                        .padding(.top, 10)
                        .buttonStyle(.plain)
                }
            
                Text(sentance.text)
                    .font(.caption)
                    .padding(.top, 20)
        }
        .onTapGesture {
            sentance.next()
        }
    }
}

#Preview {
    ContentView()
}
