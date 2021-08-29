//
//  Search.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import Foundation


struct Search: Codable {
    let start: Int?
    let numFound: Int?
    let numFoundExact: Bool?
    let num_found: Int?
    let q: String?
    let docs: [Book]?
}
