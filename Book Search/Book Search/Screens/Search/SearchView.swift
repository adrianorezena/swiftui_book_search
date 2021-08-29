//
//  SearchView.swift
//  Book Search
//
//  Created by Adriano Rezena on 28/08/21.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(.all, 9)
                        .background(Color.init(white: 0.95))
                        .cornerRadius(5)
                    
                    Button(action: {
                        viewModel.fetchBooks(expression: searchText)
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    .accentColor(.white)
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(5)
                }
                .padding()
                
                if viewModel.isSearching {
                    ProgressView()
                } else {
                    BookList(books: viewModel.books)
                }

                Spacer()
            }
            .navigationTitle("Books")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
