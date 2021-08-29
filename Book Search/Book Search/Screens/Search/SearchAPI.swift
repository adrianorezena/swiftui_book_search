//
//  SearchAPI.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import Foundation


/// class responsible for creating the Search Request that must be sent to the API.
struct SearchAPI {
    
    
    //MARK: - Private Properties
    private let networkManager: NetworkManager!
    
    
    //MARK: - Constructor
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
}


//MARK: - SearchAPIProtocol
extension SearchAPI: SearchAPIProtocol {
    
    /// Search the books in the OpenLibrary API with the desired expression
    /// - parameter expression: expression
    /// - parameter onComplete: completion block with the response
    func fetchBooks(expression: String, onComplete: @escaping (_ result: NetworkManagerResponse) -> Void) {
        
        let path: String = "https://openlibrary.org/search.json?q=\(expression)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: path) else {
            DispatchQueue.main.async {
                onComplete(.failure(APIError.apiInvalidURL))
            }
            
            return
        }
        
        Log.api("> expression: \(expression)")
        networkManager.request(url: url) { response in
            Log.api("< response: \(response)")
            onComplete(response)
        }
        
    }
    
}
