//
//  BooksList.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import SwiftUI


struct BookList: View {
    
    var books: [Book]
    
    var body: some View {
        List {
            ForEach(books, id: \.self) { book in
                BookCell(book: book)
            }
        }
    }
    
}
