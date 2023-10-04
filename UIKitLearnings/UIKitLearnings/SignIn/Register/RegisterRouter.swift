//
//  RegisterRouter.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 03/10/23.
//

import Foundation
import UIKit

protocol RegisterRouterProtocol {
    func mainViewController() -> RegisterNewUserViewController
}

class RegisterRouter: RegisterRouterProtocol { 
    func mainViewController() -> RegisterNewUserViewController {
        let vc = UIStoryboard(name: "SignInStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "registerNewUser") as! RegisterNewUserViewController
        return vc
    }
    
    func showRegisterView(from view: UIViewController) {
        view.navigationController?.pushViewController(mainViewController(), animated: true)
    }
}
