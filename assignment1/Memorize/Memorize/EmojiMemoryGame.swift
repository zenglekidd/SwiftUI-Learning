//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Le Zeng on 2020/6/14.
//  Copyright © 2020 Le Zeng. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    var game: MemoryGame<String> {
        let emojis = getRandomEmojis()
        let numberOfPairs = Int.random(in: 2 ... 5)
        
        var game = MemoryGame(numberOfPairs: numberOfPairs) { index in
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
    
    // Mark : - Private
    fileprivate func getRandomEmojis() -> [String] {
        var emojis: [String] = []
        let emojiRanges = [
            0x1F601...0x1F64F,
            0x1F680...0x1F6C0,
        ]
        
        for range in emojiRanges {
            for i in range {
                let emoji = String(UnicodeScalar(i) ?? "😝")
                emojis.append(emoji)
            }
        }
        
        emojis.shuffle()
        
        return emojis
    }
}
