//
//  RegisterNewUserViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 03/10/23.
//

import UIKit

class RegisterNewUserViewController: UIViewController {

    var presenter: RegisterPresenter?
    
    @IBOutlet weak var registerUserName: UITextField!
    @IBOutlet weak var registerUserPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        if let username = registerUserName.text,
           let password = registerUserPassword.text {
            presenter?.registerUser(with: username, password: password)
        }
    }
}
