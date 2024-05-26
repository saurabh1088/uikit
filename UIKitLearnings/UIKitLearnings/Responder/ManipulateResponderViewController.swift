//
//
// ManipulateResponderViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 01/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit
import OSLog

class ManipulateResponderViewController: UIViewController {

    @IBOutlet weak var googleChromeView: GoogleChromeColorView!
    @IBOutlet weak var googleBlueView: GoogleBlueColorView!
    @IBOutlet weak var googleGreenView: GoogleGreenColorView!
    @IBOutlet weak var googleRedView: GoogleRedColorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Investigate why self.next gives nil here, shouldn't viewcontroller have a next responder here.
        Logger.uiViewControllerEvent.info("Default next responder for ManipulateResponderViewController : \(String(describing: self.next))")
        Logger.uiViewControllerEvent.info("Default next responder for ManipulateResponderViewController's view : \(String(describing: self.view.next))")
        Logger.uiViewControllerEvent.info("Default next responder for googleChromeView : \(String(describing: self.googleChromeView.next))")
        /// Alterning the responder chain here by giving `googleChromeView` a next responder. Without
        /// providing any next responder here by default it would have been `googleChromeView's`
        /// superview, but here we explicitly provided that if `googleChromeView` doesn't handles event
        /// then next responder should be `googleGreenView`
        googleChromeView.nextViewToRespond = googleGreenView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Logger.uiViewControllerEvent.info("Default next responder for ManipulateResponderViewController in viewWillAppear : \(String(describing: self.next))")
    }
}
