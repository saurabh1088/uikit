//
//  AnimationsViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 23/09/23.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    @IBOutlet weak var circularProgressAnimationView: CircularProgressView!
    @IBOutlet weak var imageAnimationView: UIImageView!
    @IBOutlet weak var rectangularAnimationView: RectangularView!
    
    var animatingImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCircularProgressView()
        setUpAnimatingImageView()
        setUpRectangularAnimatingView()
    }
    
    // TODO: ISSUE, this is not working
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        rectangularAnimationView.animateRectangleView()
    }
}

extension AnimationsViewController {
    
    func setUpCircularProgressView() {
        let viewModel = createCircularProgressViewModel()
        circularProgressAnimationView.viewModel = viewModel
        circularProgressAnimationView.createCircularBezierPath()
        circularProgressAnimationView.center = view.center
        circularProgressAnimationView.progressAnimation(duration: 2)
        view.addSubview(circularProgressAnimationView)
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
        /// NOTE: Tint color for image works with renderingMode set to alwaysOriginal, if renderingMode is
        /// set to alwaysTemplate then there is no effect of the tint color passed here.
        imageAnimationView.image = UIImage(systemName: "smiley")?.withTintColor(.yellow, renderingMode: .alwaysOriginal)
        view.addSubview(imageAnimationView)
        UIView.animate(withDuration: 2) {
            self.imageAnimationView.transform = self.imageAnimationView.transform.rotated(by: CGFloat(Double.pi))
        }
    }
}

extension AnimationsViewController {
    
    func setUpRectangularAnimatingView() {
        view.addSubview(rectangularAnimationView)
    }
}
