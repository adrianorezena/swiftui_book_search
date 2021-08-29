//
//  SearchRepository.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import Foundation


struct SearchRepository {
    
    enum SearchRepositoryResponse {
        case success([Book]?)
        case failure(Error)
    }

    
    private let searchAPI = SearchAPI()
    
    
    /// Search the books in the OpenLibrary API with the desired expression
    /// - parameter expression: expression
    /// - parameter onComplete: completion block with the response
    // Returns an array of Books
    func fetchBooks(expression: String, onComplete: @escaping (_ result: SearchRepositoryResponse) -> Void) {
        
        Log.repository("> expression: \(expression)")
        searchAPI.fetchBooks(expression: expression) { response in
            Log.repository("< response: \(response)")
            
            switch response {
            case .success(let data):
                if let data = data {
                    do {
                        let decoded = try JSONDecoder().decode(Search.self, from: data)
                        Log.repository("< response decoded: \(decoded)")
                        
                        onComplete(.success(decoded.docs ?? []))
                        return
                    } catch {
                        Log.e("An error occurred while trying to parse the Search results: \(error.localizedDescription)")
                    }
                }
                
                onComplete(.success([]))
                
                
            case .failure(let error):
                let nsError = error as NSError
                Log.e("An error occurred in the searchAPI request. Code: \(nsError.code). Message: \(error.localizedDescription)")
                onComplete(.failure(error))
            }
        }
        
    }
    
}
