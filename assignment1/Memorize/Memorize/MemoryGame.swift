//
//  MemoryGame.swift
//  Memorize
//
//  Created by Le Zeng on 2020/6/14.
//  Copyright © 2020 Le Zeng. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    func chose(_ card: Card) {
        print("card choosed: \(card)")
    }
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for i in 0 ..< numberOfPairs {
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: i * 2))
            cards.append(Card(content: content, id: i * 2 + 1))
        }
    }
    
    mutating func shuffleCards() {
        self.cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
