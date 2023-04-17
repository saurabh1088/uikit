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
        self.tableView.register(UINib(nibName: "ToDoListItemTableViewCell",
                                      bundle: Bundle.main),
                                forCellReuseIdentifier: "toDoListItemCellIdentifier")
    }
}

extension ToDoItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListItemCellIdentifier") as! ToDoListItemTableViewCell
        if let todoItem = viewModel?.todos?[indexPath.row] {
            cell.toDoItem.text = todoItem.name
            cell.createdOn.text = DateFormatter().string(from: todoItem.createdOn ?? Date())
            cell.currentStatus.text = "Pending"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.todos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ToDoItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didSelectRowAt :: \(indexPath)")
    }
}
