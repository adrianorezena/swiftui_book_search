//
//  BookCell.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import SwiftUI


struct BookCell: View {
    
    var book: Book
    
    var body: some View {
        HStack {
            let isbn = book.isbn?.first ?? ""
            let url = URL(string: "https://covers.openlibrary.org/b/isbn/\(isbn)-S.jpg")!
            AsyncImage(
                url: url,
                placeholder: { ProgressView().frame(width: 60, height: 80, alignment: .leading) },
                image: { Image(uiImage: $0).resizable() }
            ).frame(width: 60, height: 80, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 0, content: {
                
                Text(book.title ?? "")
                    .fontWeight(.heavy)
                
                Text(book.author_name?.first ?? "")
                    .font(.caption)
                
                Text(String(book.publish_year?.first ?? 0))
                    .font(.caption)
            })
            
            Spacer()

            //AsyncImageLikeButton(repository: favoritesRepository, book: book)
        }
    }
}
