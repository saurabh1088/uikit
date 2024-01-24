//
//  UIComponentsViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 06/10/23.
//

import UIKit

class UIComponentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}



// Table View data source methods implementation
extension UIComponentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "uiComponentCollectionViewCell")!
            cell.textLabel?.text = "Collection View"
            cell.textLabel?.textColor = UIColor.white
            // By default selected cell will be highlighted with a color greyish. To turn
            // this behaviour OFF, set selectionStyle as none
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

// Table View delegate method implementation
extension UIComponentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didDeselectRowAt :: \(indexPath)")
    }
}
