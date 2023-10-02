//
//  LoginViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 02/10/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenterProtocol?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
