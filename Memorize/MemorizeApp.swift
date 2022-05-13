//
//  MemorizeApp.swift
//  Memorize
//
//  Created by wizz on 4/4/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
