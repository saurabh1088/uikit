//
//  LoginPresenter.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 02/10/23.
//

import Foundation

protocol LoginPresenterProtocol {
    var interactor: LoginInteractor? { get set }
    var router: LoginRouter? { get set }
    func openUserRegistration()
    func signInUser(with username: String, password: String)
}

class LoginPresenter: LoginPresenterProtocol {
    var interactor: LoginInteractor?
    var router: LoginRouter?
    
    func openUserRegistration() {
        router?.showRegistrationPage()
    }
    
    func signInUser(with username: String, password: String) {
        let result = interactor?.loginUser(with: username, password: password)
        if result == .userNotFound { router?.showAlert() }
    }
}
