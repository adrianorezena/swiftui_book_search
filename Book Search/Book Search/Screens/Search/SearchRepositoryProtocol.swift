//
//  SearchRepositoryProtocol.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import Foundation


enum SearchRepositoryResponse {
    case success([Book]?)
    case failure(Error)
}


protocol SearchRepositoryProtocol {
    
    func fetchBooks(expression: String, onComplete: @escaping (_ result: SearchRepositoryResponse) -> Void)
    
}
