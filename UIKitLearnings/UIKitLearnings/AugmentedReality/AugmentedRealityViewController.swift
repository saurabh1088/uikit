//
//  AugmentedRealityViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 18/08/23.
//

import UIKit
import ARKit

class AugmentedRealityViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let arConfiguration = ARWorldTrackingConfiguration()
        sceneView.session.run(arConfiguration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
}
