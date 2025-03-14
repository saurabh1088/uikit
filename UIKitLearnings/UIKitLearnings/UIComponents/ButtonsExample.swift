//
//  ButtonsExample.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 08/03/25.
//

import Foundation
import SwiftUIKitLib
import UIKit

enum ButtonsExample {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    
    var title: String {
        switch self {
        case .one: return "Button Example One"
        case .two: return "Button Example Two"
        case .three: return "Button Example Three"
        case .four: return "Button Example Four"
        case .five: return "Button Example Five"
        case .six: return "Button Example Six"
        case .seven: return "Button Example Seven"
        }
    }
    
    var font: UIFont {
        switch self {
        case .one: UIFont.systemFont(ofSize: 15)
        case .two: UIFont.systemFont(ofSize: 16)
        case .three: UIFont.systemFont(ofSize: 17)
        case .four: UIFont.systemFont(ofSize: 18)
        case .five: UIFont.systemFont(ofSize: 19)
        case .six: UIFont.systemFont(ofSize: 20)
        case .seven: UIFont.systemFont(ofSize: 21)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .one: .black
        case .two: .blue
        case .three: .red
        case .four: .gray
        case .five: .white
        case .six: .black
        case .seven: .white
        }
    }
    
    var backgroundType: ButtonBackgroundType {
        switch self {
        case .one: ButtonBackgroundType.color(.yellow)
        case .two: ButtonBackgroundType.color(.yellow)
        case .three: ButtonBackgroundType.color(.yellow)
        case .four: ButtonBackgroundType.gradient([.red, .blue, .green])
        case .five: ButtonBackgroundType.gradient([.red, .white])
        case .six: ButtonBackgroundType.color(.white)
        case .seven: ButtonBackgroundType.color(.blue)
        }
    }
}
