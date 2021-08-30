//
//  FavoritesViewModel.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import Foundation


class FavoritesViewModel: ObservableObject {
    
    @Published var books = [Book]()
    @Published var favoriteBookIDs: [String] = []
    
    let repository: FavoritesRepositoryProtocol
    
    init(repository: FavoritesRepositoryProtocol = FavoritesRepository()) {
        self.repository = repository
    }
    
    
    func addOrRemoveFavorite(_ book: Book, onComplete: @escaping () -> Void) {
        guard let key = book.key else {
            onComplete()
            return
        }
        
        repository.fetchFavorite(id: key) { localBook in
            
            if localBook == nil {
                addFavorite(book)
            } else {
                removeFavorite(book)
            }
            
            onComplete()
        }
    }
    
    func addFavorite(_ book: Book) {
        repository.addFavorite(book)
    }
    
    func removeFavorite(_ book: Book) {
        repository.removeFavorite(book)
    }
    
    
    func fetchFavorites() {
        repository.fetchFavorites { fetchedBooks in
            self.books = fetchedBooks
            self.favoriteBookIDs = fetchedBooks.compactMap({ $0.key })
        }
    }
    
}
