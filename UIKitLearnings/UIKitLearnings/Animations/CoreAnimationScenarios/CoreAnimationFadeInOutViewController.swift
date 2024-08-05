//
//  CoreAnimationFadeInOutViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 31/07/24.
//

import UIKit

class CoreAnimationFadeInOutViewController: UIViewController {
    
    enum AnimationType {
        case fadeIn
        case fadeOut
    }
    
    @IBOutlet weak var animatableView: UIView!
    @IBOutlet weak var triggerAnimationButton: UIButton!
    
    private var selectedOption: AnimationType = .fadeOut
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func triggerAnimation(_ sender: Any) {
        animateWithType(selectedOption)
    }
    
    private func animateWithType(_ type: AnimationType) {
        switch type {
        case .fadeIn:
            /// Opacity animation for fading IN animatableView
            ///
            /// Here as we are animating opacity, the keyPath needs to be set to opacity, else animation
            /// won't work. Keypath needs to refer to actual property which one expects to update.
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 0.0
            animation.toValue = 1.0
            animation.duration = 2.0
            animatableView.layer.add(animation, forKey: "fade-in")
            animatableView.layer.opacity = 1.0
            
            // Update the selected option to keep record of current selection
            selectedOption = .fadeOut
            
            /// Transition animation to update triggerAnimationButton's label
            let transition = CATransition()
            transition.duration = 1.0
            triggerAnimationButton.layer.add(transition, forKey: "title")
            triggerAnimationButton.setTitle("Fade Out", for: .normal)
        case .fadeOut:
            /// Opacity animation for fading OUT animatableView
            let animation = CABasicAnimation(keyPath: "topacity")
            animation.fromValue = 1.0
            animation.toValue = 0.0
            animation.duration = 2.0
            animatableView.layer.add(animation, forKey: "fade-out")
            animatableView.layer.opacity = 0.0
            
            // Update the selected option to keep record of current selection
            selectedOption = .fadeIn
            
            /// Transition animation to update triggerAnimationButton's label
            let transition = CATransition()
            transition.duration = 1.0
            triggerAnimationButton.layer.add(transition, forKey: "title")
            triggerAnimationButton.setTitle("Fade In", for: .normal)
        }
    }
}
