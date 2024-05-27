//
//
// ViewController.swift
// UIKitLearnings
//
// Created by Saurabh Verma on 15/04/23
// Copyright © 2023 Saurabh Verma, (saurabh1088@gmail.com). All rights reserved.
//
        

import UIKit
import OSLog

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.title = "Learnings"
    }
}

// Table View data source methods implementation
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LearningOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellType = LearningOption.optionFor(index: indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellReUseIdentifier)!
            // TODO: textLabel will be deprecated in future, look for alternative.
            cell.textLabel?.text = cellType.rawValue
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
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Logger.uiTableViewDelegateCallbacks.info("tableView didDeselectRowAt :: \(indexPath)")
        if indexPath.row == 8 {
            let viewController = PresentedViewController(nibName: "PresentedViewController", bundle: nil)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(viewController, animated: true)
        }
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
                Logger.uiViewControllerEvent.info("Successfully loaded URL in WKWebView")
            }
        } else if segue.identifier == "showSignInViewController",
                  let destinationViewController = segue.destination as? LoginViewController {
            let presenter = LoginPresenter()
            let router = LoginRouter()
            router.mainViewController = destinationViewController
            presenter.router = router
            presenter.interactor = LoginInteractor()
            destinationViewController.presenter = presenter
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewcontroller = storyboard.instantiateViewController(withIdentifier: "rootViewController")
    return viewcontroller
}
