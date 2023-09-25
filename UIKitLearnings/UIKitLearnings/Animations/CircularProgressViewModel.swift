//
//  CircularProgressViewModel.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 25/09/23.
//

import Foundation
import UIKit

class CircularProgressViewModel {
    var circlePathLayer: CAShapeLayer
    var progressViewLayer: CAShapeLayer
    var startAngle: CGFloat
    var endAngle: CGFloat
    var animationDuration: TimeInterval
    var radius: CGFloat
    
    init(circlePathLayer: CAShapeLayer,
         progressViewLayer: CAShapeLayer,
         startAngle: CGFloat,
         endAngle: CGFloat,
         animationDuration: TimeInterval,
         radius: CGFloat) {
        self.circlePathLayer = circlePathLayer
        self.progressViewLayer = progressViewLayer
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.animationDuration = animationDuration
        self.radius = radius
    }
}
