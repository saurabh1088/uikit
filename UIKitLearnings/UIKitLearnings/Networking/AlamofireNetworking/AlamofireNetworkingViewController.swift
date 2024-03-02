//
//  AlamofireNetworkingViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 01/03/24.
//

import UIKit
import Alamofire

class AlamofireNetworkingViewController: UIViewController {

    @IBOutlet weak var fetchDataButtonActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var fetchDataButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataButtonActivityIndicator.isHidden = true
    }
    
    @IBAction func fetchDataButtonAction(_ sender: Any) {
        // TODO: Format keeping in mind following MVVM approach
        fetchDataButtonActivityIndicatorAnimate(true)
        AlamofireViewModel.getAuthors {
            self.fetchDataButtonActivityIndicatorAnimate(false)
        }
    }
    
    func fetchDataButtonActivityIndicatorAnimate(_ shouldAnimate: Bool) {
        fetchDataButton.titleLabel?.isHidden = shouldAnimate
        fetchDataButtonActivityIndicator.isHidden = !shouldAnimate
        shouldAnimate ? fetchDataButtonActivityIndicator.startAnimating() : fetchDataButtonActivityIndicator.stopAnimating()
    }
}


// TODO: Move this to independent file and remove related code
class AlamofireViewModel {
    static func getAuthors(completion: @escaping () -> ()) {
        AF.request("https://openlibrary.org/authors/OL1A.json").response { response in
            print("Received Response ::")
            print("\(String(data: response.data!, encoding: .utf8) as AnyObject)")
            completion()
        }
    }
}
