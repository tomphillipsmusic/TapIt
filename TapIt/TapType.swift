//
//  TapType.swift
//  TapIt
//
//  Created by Tom Phillips on 2/16/22.
//

import SwiftUI

enum TapType: CaseIterable {
    case tap
    case doubleTap
    case swipeUp
    case swipeDown
    case swipeLeft
    case swipeRight
    
    var color: Color {
        switch self {
        case .tap:
            return .green
        case .doubleTap:
            return .blue
        case .swipeUp:
            return .red
        case .swipeDown:
            return .cyan
        case .swipeLeft:
            return .indigo
        case .swipeRight:
            return .mint
        }
    }
    
    var text: String {
        switch self {
        case .tap:
            return "TAP!"
        case .doubleTap:
            return "DOUBLE TAP!"
        case .swipeUp:
            return "SWIPE UP!"
        case .swipeDown:
            return "SWIPE DOWN!"
        case .swipeLeft:
            return "SWIPE LEFT!"
        case .swipeRight:
            return "SWIPE RIGHT!"
        }
    }
    
    static var random: TapType {
        TapType.allCases.randomElement() ?? .tap
    }
}
