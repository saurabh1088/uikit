//
//  AlamofireNetworkingViewController.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 01/03/24.
//

import UIKit
import Alamofire

class AlamofireNetworkingViewController: UIViewController {

    @IBOutlet weak var fetchDataButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fetchDataButtonAction(_ sender: Any) {
        AlamofireViewModel.getAuthors()
    }
}


// TODO: Move this to independent file and remove related code
class AlamofireViewModel {
    static func getAuthors() {
        AF.request("https://openlibrary.org/authors/OL1A.json").response { response in
            print("Received Response ::")
            print("\(String(data: response.data!, encoding: .utf8) as AnyObject)")
        }
    }
}
