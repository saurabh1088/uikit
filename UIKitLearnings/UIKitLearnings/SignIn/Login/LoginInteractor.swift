//
//  LoginInteractor.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 02/10/23.
//

import CoreData
import Foundation
import UIKit

enum LoginStatus {
    case success
    case invalidUsername
    case wrongPassword
    case userNotFound
    case failure
}

protocol LoginInteractorProtocol {}

class LoginInteractor: LoginInteractorProtocol { 
    let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func loginUser(with username: String, password: String) -> LoginStatus {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let result = try managedContext?.fetch(fetchRequest) as! [NSManagedObject]
            if result.isEmpty { return .userNotFound }
        } catch {
            return .failure
        }
        return .success
    }
}
