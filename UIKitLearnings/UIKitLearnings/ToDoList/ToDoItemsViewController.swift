//
//
// ToDoItemsViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 17/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit

class ToDoItemsViewController: UIViewController {
    var viewModel: ToDoItemsViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // If using a custom cell by subclassing UITableViewCell, the nib needs to be registered.
        self.tableView.register(UINib(nibName: "ToDoListItemTableViewCell",
                                      bundle: Bundle.main),
                                forCellReuseIdentifier: "toDoListItemCellIdentifier")
    }
}

extension ToDoItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListItemCellIdentifier") as! ToDoListItemTableViewCell
        if let todoItem = viewModel?.todos[indexPath.row] {
            cell.id = todoItem.id
            cell.toDoItem.text = todoItem.name
            cell.createdOn.text = DateFormatter().string(from: todoItem.createdOn ?? Date())
            cell.currentStatus.text = "Pending"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.todos.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel?.deleteToDoItem(indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ToDoItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didSelectRowAt :: \(indexPath)")
    }
}

extension ToDoItemsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowAddUpdateToDoItem",
           let destinationViewController = segue.destination as? NewToDoListItemViewController {
            destinationViewController.viewModel = self.viewModel
        }
    }
    
    @IBAction func unwindToToDoItemsViewController(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
        tableView.reloadData()
    }
}
