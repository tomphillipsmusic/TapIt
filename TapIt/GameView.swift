//
//  ContentView.swift
//  TapIt
//
//  Created by Tom Phillips on 2/16/22.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game: TapItGame
    
    var body: some View {
        ZStack {
            game.currentInstruction.color
            VStack {
                Text("Score: \(game.score)")
                    .font(.title)
                    .padding()
                Text(game.currentInstruction.text)
                    .font((.largeTitle))
                    .padding()
            }
        }
        .onTapGesture(count: 2) {
            game.playerGuess = .doubleTap
        }
        .onTapGesture {
            game.playerGuess = .tap
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onEnded({ value in
                    
                    if value.translation.width < -50 && abs(value.translation.width) >= abs(value.translation.height) {
                        // left
                        game.playerGuess = .swipeLeft
                    }
                    
                    else if value.translation.width > 50 && abs(value.translation.width) >= abs(value.translation.height) {
                        // right
                        game.playerGuess = .swipeRight

                    }
                    else if value.translation.height < -50 && abs(value.translation.width) <= abs(value.translation.height) {
                        // up
                        game.playerGuess = .swipeUp

                    }
                    
                    else if value.translation.height > 50 && abs(value.translation.width) <= abs(value.translation.height) {
                        // down
                        game.playerGuess = .swipeDown
                    }
                }))
        .alert(isPresented: $game.isGameOver) {
            Alert(title: Text("Game Over!"), message: Text("You scored \(game.score) points."), dismissButton: .default(Text("Play Again"), action: game.restart))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: TapItGame())
    }
}
