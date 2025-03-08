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
    
    var title: String {
        switch self {
        case .one: return "Button Example One"
        case .two: return "Button Example Two"
        case .three: return "Button Example Three"
        }
    }
    
    var font: UIFont {
        switch self {
        case .one: UIFont.systemFont(ofSize: 15)
        case .two: UIFont.systemFont(ofSize: 16)
        case .three: UIFont.systemFont(ofSize: 17)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .one: .black
        case .two: .blue
        case .three: .red
        }
    }
    
    var backgroundType: ButtonBackgroundType {
        switch self {
        case .one: ButtonBackgroundType.color(.yellow)
        case .two: ButtonBackgroundType.color(.yellow)
        case .three: ButtonBackgroundType.color(.yellow)
        }
    }
}
