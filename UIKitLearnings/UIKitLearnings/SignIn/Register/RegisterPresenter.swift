//
//  RegisterPresenter.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 03/10/23.
//

import Foundation

protocol RegisterPresenterProtocol {
    var interactor: RegisterInteractor? { get set }
    var router: RegisterRouter? { get set }
    func registerUser(with userName: String, password: String)
}

class RegisterPresenter: RegisterPresenterProtocol {
    var interactor: RegisterInteractor?
    var router: RegisterRouter?
    
    func registerUser(with userName: String, password: String) { 
        interactor?.registerAndSaveUser(with: userName, password: password)
    }
}
