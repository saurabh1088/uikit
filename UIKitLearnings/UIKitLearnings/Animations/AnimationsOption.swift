//
//  AnimationsOption.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 04/06/24.
//

import Foundation

enum AnimationsOption: String, CaseIterable {
    case circularProgressView = "Circular Progress View"
    case imageView = "Image View"
    case rectangularView = "Rectangular View"
    
    static func optionFor(index: Int) -> AnimationsOption? {
        switch index {
        case 0:
            return .circularProgressView
        case 1:
            return .imageView
        case 2:
            return .rectangularView
        default:
            return nil
        }
    }
    
    var cellReUseIdentifier: String {
        switch self {
        case .circularProgressView:
            return "circularProgressAnimationTableViewCell"
        case .imageView:
            return "imageAnimationTableViewCell"
        case .rectangularView:
            return "rectangularAnimationTableViewCell"
        }
    }
}
