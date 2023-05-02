//
//
// ResponderViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 30/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit

class ResponderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Received touchesBegan in ResponderViewController")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

/// Below are some custom views declared each subclassing `UIView` and adding a property `nextViewToRespond`
/// Also each of these custom views override `next` property which returns a `UIResponder`. By default this
/// property returns nil as `UIResponder` which defines this property doesn't stores or set the next responder
/// automatically. Instead subclasses must override and return appropriate next responder.
class GoogleChromeColorView: UIView {
    var nextViewToRespond: UIView?
    override var next: UIResponder? {
        return nextViewToRespond
    }
}

class GoogleBlueColorView: UIView {
    var nextViewToRespond: UIView?
    override var next: UIResponder? {
        return nextViewToRespond
    }
}

class GoogleGreenColorView: UIView {
    var nextViewToRespond: UIView?
    override var next: UIResponder? {
        return nextViewToRespond
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Received touchesBegan from GoogleGreenColorView")
    }
}

class GoogleRedColorView: UIView {
    var nextViewToRespond: UIView?
    override var next: UIResponder? {
        return nextViewToRespond
    }
}
