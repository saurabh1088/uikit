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
    
    @IBSegueAction func prepareView(_ coder: NSCoder) -> StoryboardSegueWithCustomInitViewController? {
        let message = "This view controller is in storyboard and is pushed via storyboard segue, also it has custom properties which are initialised by an initialiser"
        return StoryboardSegueWithCustomInitViewController(message: message,
                                                           coder: coder)
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
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "nibInstantiatedVCPushedProgrammaticallyTableViewCell", for: indexPath)
            cell.textLabel?.text = "NIB Instantiated Pushed Programmatically"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyboardSegueWithCustomInitTableViewCell", for: indexPath)
            cell.textLabel?.text = "Storyboard Segue With Custom Init"
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
}

extension ViewControllerInitOptionsViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "ViewControllerLearningsStoryboard", bundle: nil)
            if let viewController = storyboard.instantiateViewController(withIdentifier: "storyboardInstantiatedViewControllerId") as? StoryboardInstantiatedViewController {
                viewController.messageText = "This view controller is part of storyboard, but is instantiated and pushed programmatically instead of using storyboard segue"
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        } else if indexPath.row == 2 {
            let viewController = NibInstantiatedViewController(message: "This view controller is having it's own nib file and is instantiated from that.")
            self.navigationController?.pushViewController(viewController, animated: true)
        }
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
