//
//  ViewControllerInitOptionsViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 27/05/24.
//

import UIKit

class ViewControllerInitOptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ViewControllerInitOptionsViewController {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyboardSegueTableViewCell", for: indexPath)
            cell.textLabel?.text = "Storyboard Segue"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyboardInstantiatedProgrammaticallyNavigatedTableViewCell", for: indexPath)
            cell.textLabel?.text = "Storyboard Instantiated Programmatically Navigated"
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ViewControllerInitOptionsViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
}

extension ViewControllerInitOptionsViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStoryboardSegueViewController" {
            if let viewController = segue.destination as? StoryboardSegueViewController {
                viewController.message = "This view controller is in storyboard and instantiated and configured using storyboard segue"
            }
        }
    }
}
