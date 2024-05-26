//
//  NetworkingViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 29/02/24.
//

import UIKit
import OSLog

class NetworkingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension NetworkingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
}

extension NetworkingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "networkingURLSessionTableViewCell")!
            // TODO: textLabel will be deprecated in future, look for alternative.
            cell.textLabel?.text = "URL Loading System"
            cell.textLabel?.textColor = UIColor.white
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "networkingAlamofireTableViewCell")!
            // TODO: textLabel will be deprecated in future, look for alternative.
            cell.textLabel?.text = "Alamofire"
            cell.textLabel?.textColor = UIColor.white
            return cell
        }
        return UITableViewCell()
    }
}

extension NetworkingViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { return }
        if segueIdentifier == "showAlamofireNetworkingViewController" {
            if let viewController = segue.destination as? AlamofireNetworkingViewController {
                Logger.uiStoryboardEvent.info("Preparing for segue with identifier : \(segueIdentifier)")
            }
        }
    }
}
