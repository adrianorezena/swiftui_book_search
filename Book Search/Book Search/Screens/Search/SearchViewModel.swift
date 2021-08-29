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
    @Published var searchError: Bool = false
    

    private let searchRepository: SearchRepositoryProtocol
    
    
    // MARK: - Constructor
    init(searchRepository: SearchRepositoryProtocol = SearchRepository()) {
        self.searchRepository = searchRepository
    }
    
    
    func fetchBooks(expression: String) {
        searchError = false
         
        let trimmedExpression = expression.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedExpression.count > 0  else {
            books.removeAll()
            return
        }
        
        Log.viewModel("> expression: \(expression)")
        searchRepository.fetchBooks(expression: trimmedExpression) { response in
            self.isSearching = false
            
            switch response {
            case .success(let books):
                let fetchedBooks = books ?? []
                Log.viewModel("< books: \(fetchedBooks)")
                self.books = fetchedBooks
                
            case .failure(let error):
                Log.viewModel("Error fetching: \(error.localizedDescription)")
                self.searchError = true
                
            }
        }
        
        isSearching = true
    }
    
}
