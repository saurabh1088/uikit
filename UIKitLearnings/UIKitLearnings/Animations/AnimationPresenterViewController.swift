//
//  AnimationPresenterViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 24/03/24.
//

import UIKit

class AnimationPresenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

protocol AnimatableView: UIView {
    func setupAnimatableView()
}

enum AnimationView {
    case circularProgress
    case image
    case rectangular
}
