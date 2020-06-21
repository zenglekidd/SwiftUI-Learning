//
//  MemoryGame.swift
//  Memorize
//
//  Created by Le Zeng on 2020/6/14.
//  Copyright © 2020 Le Zeng. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func first(element: Element) -> Int? {
        return self.firstIndex { $0.id == element.id }
    }
}

struct MemoryGame<CardContent: Equatable> {
    private(set) var cards: [Card]
    
    var oneAndOnlyFaceUpCardIndex: Int?
    
    mutating func chose(_ card: Card) {
        // Find the card. Turn it face up or down
        
        guard let currentIndex = cards.first(element: card), !cards[currentIndex].isMatched, !cards[currentIndex].isFaceUp else { return }
        
        cards[currentIndex].isFaceUp = !cards[currentIndex].isFaceUp
        print("card choosed: \(cards[currentIndex])")
        
        if oneAndOnlyFaceUpCardIndex == nil {
            oneAndOnlyFaceUpCardIndex = currentIndex
        } else {
            if cards[oneAndOnlyFaceUpCardIndex!].content == cards[currentIndex].content {
                // matched
                cards[oneAndOnlyFaceUpCardIndex!].isMatched = true
                cards[currentIndex].isMatched = true
                
                oneAndOnlyFaceUpCardIndex = nil
            } else {
                cards[oneAndOnlyFaceUpCardIndex!].isFaceUp = false

                oneAndOnlyFaceUpCardIndex = currentIndex
            }
        }
        
        
        
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
