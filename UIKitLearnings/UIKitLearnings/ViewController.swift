//
//
// ViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 15/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.title = "Productivity"
    }
}

// Table View data source methods implementation
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewControllerTableViewCell")!
        cell.textLabel?.text = indexPath.row == 1 ? "Alarms" : "Notes"
        cell.textLabel?.textColor = UIColor.white
        // By default selected cell will be highlighted with a color greyish. To turn
        // this behaviour OFF, set selectionStyle as none
        cell.selectionStyle = .none
        return cell
    }
}

// Table View delegate method implementation
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didDeselectRowAt :: \(indexPath)")
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowToDoItems",
           let destinationViewController = segue.destination as? ToDoItemsViewController {
            destinationViewController.viewModel = ToDoItemsViewModel()
        }
    }
}
