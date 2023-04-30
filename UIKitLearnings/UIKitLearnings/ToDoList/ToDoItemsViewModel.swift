//
//
// ToDoItemsViewModel.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 17/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        
import Foundation
import UIKit
import CoreData

class ToDoItemsViewModel {
    var todos = [ToDoItem]()
    var textViewData = String()
    let managedContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addNewToDo(_ value: String) {
        let todoEntity = NSEntityDescription.entity(forEntityName: "ToDoItem", in: managedContext!)!
        let newToDO = NSManagedObject(entity: todoEntity, insertInto: managedContext)
        newToDO.setValue(UUID(), forKey: "id")
        newToDO.setValue(value, forKey: "name")
        newToDO.setValue(Date(), forKey: "createdOn")
        do {
            try managedContext?.save()
            fetchData()
        } catch {
            
        }
    }
    
    func fetchData() {
        var todoItems = [ToDoItem]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoItem")
        do {
            let result = try managedContext?.fetch(fetchRequest) as! [NSManagedObject]
            for data in result {
                todoItems.append(data as! ToDoItem)
            }
            todos = todoItems
        } catch {
            
        }
    }
    
    func deleteToDoItem(_ indexPath: IndexPath) {
        if let object = todos[indexPath.row] as? NSManagedObject {
            managedContext?.delete(object)
            todos.remove(at: indexPath.row)
        }
        do {
            try managedContext?.save()
        } catch {
            
        }
    }
}

extension ToDoItemsViewModel {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }
}
