//
//  SearchViewModel.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import Foundation


class SearchViewModel: ObservableObject {
    
    @Published var books = [Book]()
    @Published var isSearching: Bool = false
    
    private let searchRepository = SearchRepository()
    
    func fetchBooks(expression: String) {
        let trimmedExpression = expression.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedExpression.count > 0  else { return }
        
        Log.viewModel("> expression: \(expression)")
        searchRepository.fetchBooks(expression: trimmedExpression) { books in
            Log.viewModel("< books: \(books)")
            self.books = books
            self.isSearching = false
        }
        
        isSearching = true
    }
    
}
