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
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        presenter?.openUserRegistration()
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        if let username = usernameTextField.text,
           let password = passwordTextField.text {
            presenter?.signInUser(with: username, password: password)
        }
    }
}
