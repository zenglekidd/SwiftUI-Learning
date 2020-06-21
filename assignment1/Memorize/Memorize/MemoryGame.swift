//
//  MemoryGame.swift
//  Memorize
//
//  Created by Le Zeng on 2020/6/14.
//  Copyright © 2020 Le Zeng. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    
    mutating func chose(_ card: Card) {
        // Find the card. Turn it face up or down
        let index = cards.firstIndex { $0.id == card.id }
        guard let currentIndex = index else { return }
        
        cards[currentIndex].isFaceUp = !cards[currentIndex].isFaceUp
        
        print("card choosed: \(cards[currentIndex])")
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
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
