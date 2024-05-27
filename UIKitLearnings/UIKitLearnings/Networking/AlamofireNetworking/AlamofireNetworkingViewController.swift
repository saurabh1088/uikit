//
//  AlamofireNetworkingViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 01/03/24.
//

import UIKit
import Alamofire
import OSLog

class AlamofireNetworkingViewController: UIViewController {

    var viewModel: AlamofireNetworkingViewModel!
    @IBOutlet weak var fetchDataButtonActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var fetchDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataButtonActivityIndicator.isHidden = true
    }
    
    @IBAction func fetchDataButtonAction(_ sender: Any) {
        // TODO: Format keeping in mind following MVVM approach
        fetchDataButtonActivityIndicatorAnimate(true)
        
        /*
         Option 1 : Using without decoding from Alamofire
         viewModel.getAuthors {
            self.fetchDataButtonActivityIndicatorAnimate(false)
        }
        */
        
        viewModel.getAuthorsList { authors in
            self.fetchDataButtonActivityIndicatorAnimate(false)
            Logger.networkingAlamofire.info("Received authors")
            Logger.networkingAlamofire.info("\(authors)")
        }
    }
    
    func fetchDataButtonActivityIndicatorAnimate(_ shouldAnimate: Bool) {
        fetchDataButton.titleLabel?.isHidden = shouldAnimate
        fetchDataButtonActivityIndicator.isHidden = !shouldAnimate
        shouldAnimate ? fetchDataButtonActivityIndicator.startAnimating() : fetchDataButtonActivityIndicator.stopAnimating()
    }
}
