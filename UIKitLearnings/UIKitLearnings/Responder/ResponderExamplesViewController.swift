//
//
// ResponderExamplesViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 01/05/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit
import OSLog

class ResponderExamplesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ResponderExamplesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Logger.uiTableViewDelegateCallbacks.info("tableView didDeselectRowAt :: \(indexPath)")
    }
}

extension ResponderExamplesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "responderChainTableViewCell")!
            // TODO: textLabel will be deprecated in future, look for alternative.
            cell.textLabel?.text = "Responder Chain"
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "manipulateResponderChainTableViewCell")!
            // TODO: textLabel will be deprecated in future, look for alternative.
            cell.textLabel?.text = "Manipulate Responder Chain"
            return cell
        }
        return UITableViewCell()
    }
}
