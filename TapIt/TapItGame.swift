//
//  TapItGame.swift
//  TapIt
//
//  Created by Tom Phillips on 2/16/22.
//

import SwiftUI

class TapItGame: ObservableObject {
    @AppStorage("highScore") var highScore = 0
    @Published var isGameOver = false
    @Published var score = 0 {
        didSet {
            if score > highScore {
                highScore = score
            }
        }
    }
    
    @Published var currentInstruction = TapType.random
    @Published var playerGuess: TapType? {
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
