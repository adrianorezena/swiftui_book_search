//
//  Book.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import Foundation


struct Book: Codable, Hashable {
    let title: String?
    let isbn: [String]?
    let language: [String]?
    let publish_year: [Int]?
    let author_name: [String]?
}
