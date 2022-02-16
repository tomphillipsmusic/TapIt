//
//  TapItGame.swift
//  TapIt
//
//  Created by Tom Phillips on 2/16/22.
//

import Foundation

class TapItGame: ObservableObject {
    @Published var score = 0
    @Published var currentInstruction = TapType.random
    @Published var isGameOver = false
    @Published var playerGuess: TapType? = nil {
        didSet {
            if playerGuess != nil {
                determineGuess()
            }
        }
    }
    
    func restart() {
        score = 0
        currentInstruction = TapType.random
        playerGuess = nil
        isGameOver = false
    }
    
    private func determineGuess() {
        if playerGuess == currentInstruction {
            score += 1
        } else {
            isGameOver = true
        }
        
        playerGuess = nil
        currentInstruction = TapType.random
    }
}
