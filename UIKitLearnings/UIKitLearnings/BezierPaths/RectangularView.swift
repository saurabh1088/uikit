//
//  RectangularView.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 27/09/23.
//

import UIKit

class RectangularView: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        createRectangularShapeUsingBezierPath()
        UIColor.blue.setFill()
        path.fill()
    }
    
    private func createRectangularShapeUsingBezierPath() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: frame.width))
        path.addLine(to: CGPoint(x: frame.width, y: frame.width))
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.close()
        self.path = path
    }
    
    // TODO: ISSUE, this is not working
    func animateRectangleView() {
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = UIBezierPath().cgPath
        animation.toValue = self.path.cgPath
        animation.duration = 2
    }
}
