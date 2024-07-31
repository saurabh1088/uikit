//
//  AnimationsOption.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 04/06/24.
//

import Foundation

enum AnimationsOption: String, CaseIterable {
    case coreAnimation = "Core Animation"
    case circularProgressView = "Circular Progress View"
    case imageView = "Image View"
    case rectangularView = "Rectangular View"
    
    static func optionFor(index: Int) -> AnimationsOption? {
        switch index {
        case 0:
            return .coreAnimation
        case 1:
            return .circularProgressView
        case 2:
            return .imageView
        case 3:
            return .rectangularView
        default:
            return nil
        }
    }
    
    var cellReUseIdentifier: String {
        switch self {
        case .coreAnimation:
            return "coreAnimationAnimationTableViewCell"
        case .circularProgressView:
            return "circularProgressAnimationTableViewCell"
        case .imageView:
            return "imageAnimationTableViewCell"
        case .rectangularView:
            return "rectangularAnimationTableViewCell"
        }
    }
}
