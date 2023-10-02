//
//  User+CoreDataProperties.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 02/10/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var password: String?
    @NSManaged public var username: String?

}

extension User : Identifiable {

}
