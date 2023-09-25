//
//  AnimationsViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 23/09/23.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    var circularProgressView: CircularProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCircularProgressView()
    }
    
    func setUpCircularProgressView() {
        let viewModel = createCircularProgressViewModel()
        let frame = CGRect(x: 0, y: 0, width: viewModel.radius, height: viewModel.radius)
        circularProgressView = CircularProgressView(viewModel: viewModel,
                                                    frame: frame)
        circularProgressView.createCircularBezierPath()
        circularProgressView.center = view.center
        circularProgressView.progressAnimation(duration: 2)
        view.addSubview(circularProgressView)
    }
    
    func createCircularProgressViewModel() -> CircularProgressViewModel {
        return CircularProgressViewModel(circlePathLayer: CAShapeLayer(),
                                         progressViewLayer: CAShapeLayer(),
                                         startAngle: CGFloat(-Double.pi / 2),
                                         endAngle: CGFloat(3 * Double.pi / 2),
                                         animationDuration: 2,
                                         radius: 60)
    }
}
