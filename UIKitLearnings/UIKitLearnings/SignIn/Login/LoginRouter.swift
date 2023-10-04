//
//  LoginRouter.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 02/10/23.
//

import Foundation
import UIKit

protocol LoginRouterProtocol {}

class LoginRouter: LoginRouterProtocol { 
    var mainViewController: UIViewController!
    
    func showRegistrationPage() {
        RegisterRouter().showRegisterView(from: mainViewController)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Test", message: "Test message", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        mainViewController.present(alert, animated: true, completion: nil)
    }
}
