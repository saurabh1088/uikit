//
//  CoreAnimationBackgroundColorViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 31/07/24.
//

import UIKit

class CoreAnimationBackgroundColorViewController: UIViewController {

    @IBOutlet weak var targetView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Here background color for `targetView` is being updated to `paletteYellow` color by
    /// accessing the view's backing layer and then updating the layer's background color.
    ///
    /// The same can be achieved by following code
    /// `targetView.backgroundColor = UIColor.paletteYellow`
    ///
    /// There is however no difference in either approaches, unless proven otherwise it appears that
    /// the view's backgroundColor property eventually is a wrapper for underlying layer's one.
    @IBAction func updateBackgroundColor(_ sender: Any) {
        targetView.layer.backgroundColor = UIColor.paletteYellow.cgColor
    }
}
