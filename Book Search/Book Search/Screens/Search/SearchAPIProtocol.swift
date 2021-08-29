//
//  SearchAPIProtocol.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import Foundation


protocol SearchAPIProtocol {
    
    func fetchBooks(expression: String, onComplete: @escaping (_ result: NetworkManagerResponse) -> Void)
    
}
