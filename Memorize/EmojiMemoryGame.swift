//
//  EmojiMenoryGame.swift
//  Memorize
//
//  Created by wizz on 4/7/22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static var emojis = ["✈️","🚗","🏍","🛳","🦼","🛴","🚲","🚝","🛺","🚑","🚒","🛻","🚛","🚜","🚁","🛸","🛶","🚂","🏎","🛵","🚡","🚔","🚎","🛫"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 7) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
//        emojis[pairIndex]
//    }
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK:- Intent(s)
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
