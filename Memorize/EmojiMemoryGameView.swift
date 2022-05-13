//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by wizz on 4/4/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    //    @State var emojis = ["✈️","🚗","🏍","🛳","🦼","🛴","🚲","🚝","🛺","🚑","🚒","🛻","🚛","🚜","🚁","🛸","🛶","🚂","🏎","🛵","🚡","🚔","🚎","🛫"]
    //
    //    var vehicles = ["✈️","🚗","🏍","🛳","🦼","🛴","🚲","🚝","🛺","🚑","🚒","🛻","🚛","🚜","🚁","🛸","🛶","🚂","🏎","🛵","🚡","🚔","🚎","🛫"]
    //
    //
    //    var faces = ["😃","😇","😰","🥲","😶‍🌫️","🤥","🤯","🧐","😡","🥸","🫡","😴","🤠","🤗","😤","🤪","🥰","😎","😱","🫣"]
    //
    //    var nature = ["🌵","🎄","🍀","🍄","💐","🍁","🌺","🌸","🪺","🌾","🪵","🌴","🎍","🍃","🪸","🪴","🎋"]
    
    
    //@State var emojiCount = 16
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            }else{
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        })
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90)).padding(DrawingConstants.PiePadding).opacity(DrawingConstants.PieOpacity)
                Text(card.content)
                    //.rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    //.animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .scaleEffect(card.isMatched ? 1.5 : 1)
                    .animation(Animation.linear(duration: 1).repeatForever())
                    .font(font(in: geometry.size))
                    //.font(Font.system(size: DrawingConstants.fontSize))
                    //.scaleEffect(scale(thatFits: geometry.size))
                
                
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize)
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 38
        static let PiePadding: CGFloat = 5
        static let PieOpacity: CGFloat = 0.5
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        //        EmojiMemoryGameView(game: game)
        //            .preferredColorScheme(.dark)
    }
}



