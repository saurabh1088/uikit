//
//
// ToDoItem+CoreDataProperties.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 16/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        
//

import Foundation
import CoreData


extension ToDoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoItem> {
        return NSFetchRequest<ToDoItem>(entityName: "ToDoItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var createdOn: Date?

}

extension ToDoItem : Identifiable {

}
