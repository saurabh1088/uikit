//
//  AlamofireNetworkingViewModel.swift
//  UIKitLearnings
//
//  Created by Saurabh Verma on 27/05/24.
//

import Foundation
import Alamofire
import OSLog

class AlamofireNetworkingViewModel {
    /// Here Alamofire API used to make network call returns a response which is not decoded to any type and
    /// the decoding needs to be handled by the caller.
    func getAuthors(completion: @escaping () -> ()) {
        AF.request("https://openlibrary.org/authors/OL1A.json").response { response in
            Logger.networkingAlamofire.info("Received Response ::")
            let responseString = String(data: response.data!, encoding: .utf8)!
            Logger.networkingAlamofire.info("\(responseString)")
            completion()
        }
    }
    
    /// Here Alamofire API used to make network call returns a result which contains a response decoded to
    /// type provided.
    func getAuthorsList(completion: @escaping (OpenLibraryAuthors) -> ()) {
        AF.request("https://openlibrary.org/authors/OL1A.json").responseDecodable(of: OpenLibraryAuthors.self) { response in
            Logger.networkingAlamofire.info("Received Response ::")
            switch response.result {
            case .success(let success):
                completion(success)
            case .failure(let failure):
                Logger.networkingAlamofire.error("Some error occured :: \(failure)")
            }
        }
    }
}
