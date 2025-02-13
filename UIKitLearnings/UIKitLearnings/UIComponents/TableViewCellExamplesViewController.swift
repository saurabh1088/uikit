//
//  TableViewCellExamplesViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 11/02/25.
//

import UIKit
import SwiftUIKitLib

class TableViewCellExamplesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        /// packageBundleSwiftUIKitLib is required to fix below issue which comes if Bundle.module is used instead
        /// 'module' is inaccessible due to 'internal' protection level
        /// Also not as XIB is part of package, here nil can't be passed
        let bundle = Bundle.packageBundleSwiftUIKitLib
        
        /// Passing nil for bundle here will give below runtime error as SingleDetailTableViewCell nib is part of package dependency
        /// Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Could not load NIB in bundle: 'NSBundle
        tableView.register(UINib(nibName: "SingleDetailTableViewCell", bundle: bundle), forCellReuseIdentifier: "singleDetailTableViewCellId")
    }
}

extension TableViewCellExamplesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "singleDetailTableViewCellId", for: indexPath) as? SingleDetailTableViewCell {
            cell.configureDetailLabel(text: "Single Detail Table View Cell",
                                      font: .systemFont(ofSize: 18, weight: .bold),
                                      textColor: .blue,
                                      backgroundColor: .darkGray)
            return cell
        }
        return UITableViewCell()
    }
}

extension TableViewCellExamplesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88.0
    }
}
