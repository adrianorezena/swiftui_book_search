//
//  BookCell.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import SwiftUI


struct BookCell: View {
    
    var book: Book
    @State var isFavorite: Bool = false
    let likeAction: LikeButtonPressed
    
    var body: some View {
        HStack {
            let isbn = book.isbn?.first ?? ""
            
            if (book.isbn?.count ?? 0) > 0 {
                let url = URL(string: "https://covers.openlibrary.org/b/isbn/\(isbn)-M.jpg")!
                AsyncImage(
                    url: url,
                    placeholder: { ProgressView().frame(width: 60, height: 80, alignment: .center) },
                    image: { Image(uiImage: $0).resizable() }
                ).frame(width: 60, height: 80, alignment: .center)
            } else {
                Image("imgBook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 80, alignment: .center)
            }
            
            
            VStack(alignment: .leading, spacing: 2, content: {
                
                Text(book.title ?? "")
                    .fontWeight(.heavy)
                
                Text(book.author_name?.first ?? "")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                
                Text(String(book.publish_year?.first ?? 0))
                    .font(.caption)
                    .foregroundColor(Color.gray)
            })
            
            Spacer()

            LikeButton(isFavorite: isFavorite, likeAction: addRemoveFavorite())
        }
    }
    
    
    func addRemoveFavorite() -> ButtonPressed {
        return {
            likeAction?(book)
        }
    }
    
}
