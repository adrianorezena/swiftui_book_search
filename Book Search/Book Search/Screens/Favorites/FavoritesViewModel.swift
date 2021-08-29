//
//  FavoritesViewModel.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import Foundation


protocol FavoritesViewModelProtocol: ObservableObject {
    
    func addFavorite(_ book: Book)
    func fetchFavorites()
    
}


class FavoritesViewModel: FavoritesViewModelProtocol {
    
    @Published var books = [Book]()
    @Published var favoriteBookIDs: [String] = []
    
    func addOrRemoveFavorite(_ book: Book, onComplete: @escaping () -> Void) {
        let repository = FavoritesRepository()
        
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
        let repository = FavoritesRepository()
        repository.addFavorite(book)
    }
    
    func removeFavorite(_ book: Book) {
        let repository = FavoritesRepository()
        repository.removeFavorite(book)
    }
    
    
    func fetchFavorites() {
        let repository = FavoritesRepository()
        repository.fetchFavorites { fetchedBooks in
            self.books = fetchedBooks
            self.favoriteBookIDs = fetchedBooks.compactMap({ $0.key })
        }
    }
    
}
