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
        tableView.register(UINib(nibName: "SingleDetailTableViewCell", bundle: bundle), forCellReuseIdentifier: "SingleDetailTableViewCell")
        tableView.register(UINib(nibName: "DismissableTitleMessageTableViewCell", bundle: bundle), forCellReuseIdentifier: "DismissableTitleMessageTableViewCell")
        
        // TODO: This doesn't works and lead to a crash as IBOutlets aren't initialised
        /*
         Error while using this code :
         - SwiftUIKitLib/SingleDetailTableViewCell.swift:38: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
         
        tableView.register(SingleDetailTableViewCell.self)
        tableView.register(DismissableTitleMessageTableViewCell.self)
        */

    }
}

// MARK: Extension UITableViewDataSource conformance
extension TableViewCellExamplesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0, 2, 3:
                return configureSingleDetailCell(for: indexPath)
            case 1:
            let cell: DismissableTitleMessageTableViewCell = tableView.dequeueReusableCell(DismissableTitleMessageTableViewCell.self, for: indexPath)
                let title = "Title"
                let message = "Detailed message"
                let image = UIImage(systemName: "exclamationmark.triangle")
                cell.configure(with: title, message: message, icon: image) { [weak self] in
                    self?.showDismissConfirmation(cell.dismissButtonControl)
                } actionButtonAction: {
                    print("User tapped the action button")
                }
                return cell
            default:
                fatalError("Unexpected indexPath.row: \(indexPath.row)")
        }
    }
}

// MARK: Extension UITableViewDelegate conformance
extension TableViewCellExamplesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88.0
    }
}

// MARK: Extension DismissableTitleMessageTableViewCell alert
extension TableViewCellExamplesViewController {
    private func showDismissConfirmation(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Confirm Dismiss", message: "Are you sure you want to dismiss this item?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { _ in
            print("User confirmed to dismiss item")
        }
        alertController.addAction(yesAction)
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: { [self] _ in
            performOption2(sender: sender)
        })
        alertController.addAction(noAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Option 1: Delayed accessibility notification
    private func performOption1(sender: Any?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            UIAccessibility.post(notification: .layoutChanged, argument: sender)
        })
    }

    // Option 2: Immediate accessibility notification
    private func performOption2(sender: Any?) {
        DispatchQueue.main.async {
            UIAccessibility.post(notification: .layoutChanged, argument: sender)
        }
    }

    // Option 3: Complex accessibility setup with delays
    private func performOption3(sender: Any?) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.isAccessibilityElement = false
            self?.navigationController?.navigationBar.isAccessibilityElement = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                UIAccessibility.post(notification: .layoutChanged, argument: sender)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self?.tableView.isAccessibilityElement = true
                    self?.navigationController?.navigationBar.isAccessibilityElement = true
                })
            })
        }
    }
}

// MARK: Tableview helper methods for creating tableview cells
extension TableViewCellExamplesViewController {
    func configureSingleDetailCell(for indexPath: IndexPath) -> SingleDetailTableViewCell {
        let cell = tableView.dequeueReusableCell(SingleDetailTableViewCell.self, for: indexPath)
        cell.configureDetailLabel(text: "Single Detail Table View Cell",
                                      font: .systemFont(ofSize: 18, weight: .bold),
                                      textColor: .blue,
                                      backgroundColor: .darkGray)
        return cell
    }
}
