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
    static func getAuthors(completion: @escaping () -> ()) {
        AF.request("https://openlibrary.org/authors/OL1A.json").response { response in
            print("Received Response ::")
            print("\(String(data: response.data!, encoding: .utf8) as AnyObject)")
            completion()
        }
    }
    
    static func getAuthorsList(completion: @escaping (Authors) -> ()) {
        AF.request("https://openlibrary.org/authors/OL1A.json").responseDecodable(of: Authors.self) { response in
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

// TODO: These needs refactoring, some repititions can be abstracted and proper naming conventions need to follow.
struct Authors: Codable {
    var name: String
    var personal_name: String
    var death_date: String
    var alternate_names: [String]
    var key: String
    var birth_date: String
    var type: AuthorType
    var remote_ids: AuthorRemoteIDs
    var photos: [Int]
    var bio: AuthorBio
    var latest_revision: Int
    var revision: Int
    var created: AuthorCreated
    var last_modified: AuthorLastModified
}

struct AuthorType: Codable {
    var key: String
}

struct AuthorRemoteIDs: Codable {
    var wikidata: String
    var isni: String
    var viaf: String
}

struct AuthorBio: Codable {
    var type: String
    var value: String
}

struct AuthorCreated: Codable {
    var type: String
    var value: String
}

struct AuthorLastModified: Codable {
    var type: String
    var value: String
}
