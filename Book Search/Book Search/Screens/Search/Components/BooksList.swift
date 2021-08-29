//
//  BooksList.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import SwiftUI


struct BookList: View {
    
    var books: [Book]
    var favoriteBookIDs: [String]
    let likeAction: LikeButtonPressed
    
    var body: some View {
        List {
            ForEach(books, id: \.self) { book in
                BookCell(
                    book: book,
                    isFavorite: favoriteBookIDs.contains(book.key ?? ""),
                    likeAction: likeAction
                )
            }
        }
    }
    
}
