//
//  Book.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import Foundation


struct Book: Codable, Hashable {
    let key: String?
    let title: String?
    let isbn: [String]?
    let language: [String]?
    let publish_year: [Int]?
    let author_name: [String]?
}


extension LocalBook {
    
    func toBook() -> Book {
        let book = Book(
            key: key,
            title: title,
            isbn: isbn as? [String],
            language: language as? [String],
            publish_year: publish_year as? [Int],
            author_name: author_name as? [String]
        )
        
        return book
    }
    
}
