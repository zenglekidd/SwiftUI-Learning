//
//  ContentView.swift
//  Memorize
//
//  Created by Le Zeng on 2020/6/14.
//  Copyright © 2020 Le Zeng. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var game: EmojiMemoryGame = EmojiMemoryGame()
    
    var body: some View {
        HStack {
            ForEach(game.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.game.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
            }

        }
        .aspectRatio(2.0/3.0, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            ContentView()
                .previewLayout(PreviewLayout.fixed(width: 568, height: 320))
                .previewDisplayName("landscape")
        }
        
    }
}
