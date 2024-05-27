//
//  ViewControllerLearningsViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 27/05/24.
//

import UIKit

class ViewControllerLearningsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ViewControllerLearningsViewController {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "uiViewControllerInitOptionsTableViewCell", for: indexPath)
        cell.textLabel?.text = "UIViewController Init Options"
        return cell
    }
}

extension ViewControllerLearningsViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
}
