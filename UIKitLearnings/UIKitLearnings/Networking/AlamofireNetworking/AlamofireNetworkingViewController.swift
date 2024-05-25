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
        
        /*
         Option 1 : Using without decoding from Alamofire
        AlamofireViewModel.getAuthors {
            self.fetchDataButtonActivityIndicatorAnimate(false)
        }
        */
        
        AlamofireViewModel.getAuthorsList { authors in
            self.fetchDataButtonActivityIndicatorAnimate(false)
            print("Received authors")
            print(authors)
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
    /// Here Alamofire API used to make network call returns a response which is not decoded to any type and
    /// the decoding needs to be handled by the caller.
    static func getAuthors(completion: @escaping () -> ()) {
        AF.request("https://openlibrary.org/authors/OL1A.json").response { response in
            print("Received Response ::")
            print("\(String(data: response.data!, encoding: .utf8) as AnyObject)")
            completion()
        }
    }
    
    /// Here Alamofire API used to make network call returns a result which contains a response decoded to
    /// type provided.
    static func getAuthorsList(completion: @escaping (OpenLibraryAuthors) -> ()) {
        AF.request("https://openlibrary.org/authors/OL1A.json").responseDecodable(of: OpenLibraryAuthors.self) { response in
            print("Received Response ::")
            switch response.result {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                print("Some error occured :: \(failure)")
            }
        }
    }
}
