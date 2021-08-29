//
//  FavoritesViewModelProtocol.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import Foundation


protocol FavoritesRepositoryProtocol {
    
    func addFavorite(_ book: Book)
    func removeFavorite(_ book: Book)
    func fetchFavorite(id: String, onComplete: (LocalBook?) -> Void)
    func fetchFavorites(onComplete: ([Book]) -> Void)
    
}
