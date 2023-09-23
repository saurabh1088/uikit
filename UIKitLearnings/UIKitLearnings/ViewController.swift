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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "notesTableViewCell")!
            cell.textLabel?.text = "Notes"
            cell.textLabel?.textColor = UIColor.white
            // By default selected cell will be highlighted with a color greyish. To turn
            // this behaviour OFF, set selectionStyle as none
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "responderTableViewCell")!
            cell.textLabel?.text = "Responder"
            cell.textLabel?.textColor = UIColor.white
            // By default selected cell will be highlighted with a color greyish. To turn
            // this behaviour OFF, set selectionStyle as none
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "webViewTableViewCell")!
            cell.textLabel?.text = "Web View"
            cell.textLabel?.textColor = UIColor.white
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "augmentedRealityTableViewCell")!
            cell.textLabel?.text = "Augmented Reality"
            cell.textLabel?.textColor = UIColor.white
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animationsTableViewCell")!
            cell.textLabel?.text = "Animations"
            cell.textLabel?.textColor = UIColor.white
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
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
            let viewModel = ToDoItemsViewModel()
            viewModel.fetchData()
            destinationViewController.viewModel = viewModel
        } else if segue.identifier == "showWebViewController",
            let destinationViewController = segue.destination as? WebViewController {
            destinationViewController.url = URL(string: "https://www.swift.org/documentation/")
            destinationViewController.onSuccess = {
                print("Successfully loaded URL in WKWebView")
            }
        }
    }
}
