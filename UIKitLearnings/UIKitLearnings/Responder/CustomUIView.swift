//
//
// CustomUIView.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 01/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit

class CustomUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    /// `touches` here is a `Set` (defined as `Set<UITouch>`). Even though this is a `Set`, `touches`
    /// only contains ONE touch by default.
    /// To receive multiple touches in this `Set`, the view's `isMultipleTouchEnabled` must be set to `true`
    ///
    /// This method gets called whenever a new touch is detected in a responder.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Received touchesBegan from CustomUIView")
        super.touchesBegan(touches, with: event)
        next?.touchesBegan(touches, with: event)
    }
}
