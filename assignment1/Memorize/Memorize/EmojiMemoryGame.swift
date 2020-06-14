//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Le Zeng on 2020/6/14.
//  Copyright © 2020 Le Zeng. All rights reserved.
//

import Foundation

struct EmojiMemoryGame {
    private var game: MemoryGame<String> {
        
        let emojis = ["🛺","✈️","⛵️","🚢"]
        
        var game = MemoryGame(numberOfPairs: emojis.count) { index in
            emojis[index]
        }
        game.shuffleCards()
        
        return game
    }
    
    var cards: [MemoryGame<String>.Card] {
        game.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        game.chose(card)
    }
}
