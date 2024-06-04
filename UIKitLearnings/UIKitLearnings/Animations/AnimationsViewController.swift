//
//  AnimationsViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 23/09/23.
//

import UIKit
import OSLog

class AnimationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var selectedAnimationOption: AnimationsOption?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AnimationsViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AnimationsOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let animationOption = AnimationsOption.optionFor(index: indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: animationOption.cellReUseIdentifier, for: indexPath)
            cell.textLabel?.text = animationOption.rawValue
            cell.textLabel?.textColor = UIColor.white
            // By default selected cell will be highlighted with a color greyish. To turn
            // this behaviour OFF, set selectionStyle as none
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension AnimationsViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Logger.uiTableViewDelegateCallbacks.info("AnimationsViewController tableView didSelectRowAt \(indexPath)")
        selectedAnimationOption = AnimationsOption.optionFor(index: indexPath.row)
        self.performSegue(withIdentifier: "showAnimationPlayViewController", sender: self)
    }
}

extension AnimationsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAnimationPlayViewController" {
            if let viewController = segue.destination as? AnimationPlayViewController,
               let selectedOption = selectedAnimationOption {
                viewController.animationOption = selectedOption
            }
        }
    }
}
