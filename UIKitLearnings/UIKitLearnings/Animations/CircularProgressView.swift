//
//  CircularProgressView.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 24/09/23.
//

import UIKit

class CircularProgressView: UIView {
    
    private var viewModel: CircularProgressViewModel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: CircularProgressViewModel, frame: CGRect) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    func createCircularBezierPath() {
        let uiBezierPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2),
                                        radius: viewModel.radius,
                                        startAngle: viewModel.startAngle,
                                        endAngle: viewModel.endAngle,
                                        clockwise: true)
        viewModel.circlePathLayer.path = uiBezierPath.cgPath
        viewModel.circlePathLayer.fillColor = UIColor.clear.cgColor
        viewModel.circlePathLayer.lineCap = .round
        viewModel.circlePathLayer.lineWidth = 20.0
        viewModel.circlePathLayer.strokeEnd = 1.0
        viewModel.circlePathLayer.strokeColor = UIColor.black.cgColor
        
        layer.addSublayer(viewModel.circlePathLayer)

        viewModel.progressViewLayer.path = uiBezierPath.cgPath
        viewModel.progressViewLayer.fillColor = UIColor.clear.cgColor
        viewModel.progressViewLayer.lineCap = .round
        viewModel.progressViewLayer.lineWidth = 10.0
        viewModel.progressViewLayer.strokeEnd = 0
        viewModel.progressViewLayer.strokeColor = UIColor.green.cgColor

        layer.addSublayer(viewModel.progressViewLayer)
    }
    
    func progressAnimation(duration: TimeInterval) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        viewModel.progressViewLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
