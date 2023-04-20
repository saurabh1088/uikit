//
//
// MasterTableViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 19/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit

class MasterTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Productivity"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewControllerTableViewCell")!
        cell.textLabel?.text = indexPath.row == 1 ? "Alarms" : "Notes"
        cell.textLabel?.textColor = UIColor.white
        // By default selected cell will be highlighted with a color greyish. To turn
        // this behaviour OFF, set selectionStyle as none
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didDeselectRowAt :: \(indexPath)")
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueShowToDoItems",
           let destinationViewController = segue.destination as? ToDoItemsViewController {
            let viewModel = ToDoItemsViewModel()
            viewModel.fetchData()
            destinationViewController.viewModel = viewModel
        }
    }

}

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
    }
    
    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
            return .primary
      }
}
