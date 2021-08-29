//
//  FavoritesView.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import SwiftUI

struct FavoritesView: View {
    
    @ObservedObject var viewModel = FavoritesViewModel()

    var body: some View {
        NavigationView {
            VStack {
                BookList(
                    books: viewModel.books,
                    favoriteBookIDs: viewModel.favoriteBookIDs,
                    likeAction: onFavoriteButton()
                )
            }
            .navigationTitle("Favorites")
            .onAppear() {
                viewModel.fetchFavorites()
            }
        }
    }
    
    
    func onFavoriteButton() -> LikeButtonPressed {
        return { book in
            self.viewModel.addOrRemoveFavorite(book) {
                self.viewModel.fetchFavorites()
            }
        }
    }
    
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
