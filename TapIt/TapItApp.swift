//
//  TapItApp.swift
//  TapIt
//
//  Created by Tom Phillips on 2/16/22.
//

import SwiftUI

@main
struct TapItApp: App {
    @StateObject var game = TapItGame()
    
    var body: some Scene {
        WindowGroup {
            GameView(game: game)
        }
    }
}
