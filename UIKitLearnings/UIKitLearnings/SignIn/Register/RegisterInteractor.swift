//
//  RegisterInteractor.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 03/10/23.
//

import CoreData
import Foundation
import UIKit

protocol RegisterInteractorProtocol {
    func registerAndSaveUser(with username: String, password: String)
}

class RegisterInteractor: RegisterInteractorProtocol {
    let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func registerAndSaveUser(with username: String, password: String) {
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext!)!
        let newUser = NSManagedObject(entity: userEntity, insertInto: managedContext)
        newUser.setValue(UUID(), forKey: "id")
        newUser.setValue(username, forKey: "username")
        newUser.setValue(password, forKey: "password")
        do {
            try managedContext?.save()
        } catch {
            
        }
    }
    
}
