//
//  AnimationsViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 23/09/23.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    var circularProgressView: CircularProgressView!
    var animatingImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCircularProgressView()
        setUpAnimatingImageView()
    }
}

extension AnimationsViewController {
    
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

extension AnimationsViewController {
    
    func setUpAnimatingImageView() {
        animatingImageView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2,
                                                       y: UIScreen.main.bounds.size.height - 200,
                                                       width: 50,
                                                       height: 50))
        /// NOTE: Tint color for image works with renderingMode set to alwaysOriginal, if renderingMode is
        /// set to alwaysTemplate then there is no effect of the tint color passed here.
        animatingImageView.image = UIImage(systemName: "smiley")?.withTintColor(.yellow, renderingMode: .alwaysOriginal)
        view.addSubview(animatingImageView)
        UIView.animate(withDuration: 2) {
            self.animatingImageView.frame = CGRect(x: UIScreen.main.bounds.size.width / 2,
                                                   y: UIScreen.main.bounds.size.height - 200,
                                                   width: 150,
                                                   height: 150)
        }
    }
}
