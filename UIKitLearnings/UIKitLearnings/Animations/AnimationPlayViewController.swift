//
//  AnimationPlayViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 04/06/24.
//

import UIKit

class AnimationPlayViewController: UIViewController {

    var animationOption: AnimationsOption!
    
    @IBOutlet weak var animatingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let animatingView = getAnimationView() {
            self.animatingView.addSubview(animatingView)
        }
    }
    
    // TODO: At present animation gets started as view appears, there should be way to toggle animation once view is loaded.
    func getAnimationView() -> UIView? {
        if let animationOption = animationOption {
            switch animationOption {
            case .coreAnimation:
                return setUpCoreAnimationView()
            case .circularProgressView:
                return setUpCircularProgressView()
            case .imageView:
                return setUpAnimatingImageView()
            case .rectangularView:
                return setUpRectangularAnimatingView()
            }
        }
        return nil
    }
}

extension AnimationPlayViewController {

    func setUpCircularProgressView() -> UIView {
        // TODO: Fix issue with alignment.
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let circularProgressAnimationView = CircularProgressView(viewModel: createCircularProgressViewModel(),
                                                                 frame: frame)
        let viewModel = createCircularProgressViewModel()
        circularProgressAnimationView.viewModel = viewModel
        circularProgressAnimationView.createCircularBezierPath()
        circularProgressAnimationView.center = self.animatingView.center
        circularProgressAnimationView.progressAnimation(duration: 2)
        return circularProgressAnimationView
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

extension AnimationPlayViewController {

    func setUpAnimatingImageView() -> UIView {
        /// NOTE: Tint color for image works with renderingMode set to alwaysOriginal, if renderingMode is
        /// set to alwaysTemplate then there is no effect of the tint color passed here.
        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let imageAnimationView = UIImageView(frame: frame)
        imageAnimationView.image = UIImage(systemName: "smiley")?.withTintColor(.yellow, renderingMode: .alwaysOriginal)
        view.addSubview(imageAnimationView)
        UIView.animate(withDuration: 2) {
            imageAnimationView.transform = imageAnimationView.transform.rotated(by: CGFloat(Double.pi))
        }
        return imageAnimationView
    }
}

extension AnimationPlayViewController {
    
    func setUpRectangularAnimatingView() -> UIView {
        return RectangularView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    }
}

extension AnimationPlayViewController {
    
    func setUpCoreAnimationView() -> UIView {
        return UIView()
    }
}
