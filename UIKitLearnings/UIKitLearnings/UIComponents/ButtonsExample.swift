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
    
    var title: String {
        switch self {
        case .one: return "Button Example One"
        case .two: return "Button Example Two"
        case .three: return "Button Example Three"
        case .four: return "Button Example Four"
        }
    }
    
    var font: UIFont {
        switch self {
        case .one: UIFont.systemFont(ofSize: 15)
        case .two: UIFont.systemFont(ofSize: 16)
        case .three: UIFont.systemFont(ofSize: 17)
        case .four: UIFont.systemFont(ofSize: 18)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .one: .black
        case .two: .blue
        case .three: .red
        case .four: .gray
        }
    }
    
    var backgroundType: ButtonBackgroundType {
        switch self {
        case .one: ButtonBackgroundType.color(.yellow)
        case .two: ButtonBackgroundType.color(.yellow)
        case .three: ButtonBackgroundType.color(.yellow)
        case .four: ButtonBackgroundType.color(.clear)
        }
    }
    
    var gradientColors: [UIColor]? {
        switch self {
        case .four: [.red, .blue, .green]
        default : nil
        }
    }
}
