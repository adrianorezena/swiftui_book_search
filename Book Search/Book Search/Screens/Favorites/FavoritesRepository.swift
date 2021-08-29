//
//  FavoritesRepository.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import Foundation


struct FavoritesRepository: CoreDataRepositoryProtocol {
    
    func addFavorite(_ book: Book) {
        guard let context = CoreDataContextMananger.shared.context else { return }
        
        let newBook = LocalBook(context: context)
        newBook.key = book.key
        newBook.title = book.title
        newBook.author_name = book.author_name as? NSObject
        newBook.isbn = book.isbn as? NSObject
        newBook.language = book.language as? NSObject
        newBook.publish_year = book.publish_year as? NSObject
        
        saveContext(context)
    }
    
    
    func removeFavorite(_ book: Book) {
        guard
            let context = CoreDataContextMananger.shared.context,
            let key = book.key
        else
            { return }
        
        fetchFavorite(id: key) { localBook in
            if let localBook = localBook {
                context.delete(localBook)
                saveContext(context)
            }
        }
    }
    
    
    func fetchFavorite(id: String, onComplete: (LocalBook?) -> Void) {
        guard let context = CoreDataContextMananger.shared.context else { return }
        
        let localBooks = fetchData(entity: LocalBook.self, predicate: NSPredicate(format: "key == %@", id), context: context)
        onComplete(localBooks.first)
    }
    
    
    func fetchFavorites(onComplete: ([Book]) -> Void) {
        guard let context = CoreDataContextMananger.shared.context else { return }
        
        let localBooks = fetchData(entity: LocalBook.self, sortDescriptors: [NSSortDescriptor(key: "title", ascending: true)], context: context)
        onComplete(localBooks.compactMap({ $0.toBook() }))
    }
    
}
