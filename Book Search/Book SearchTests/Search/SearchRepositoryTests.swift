//
//  SearchRepositoryTests.swift
//  Book SearchTests
//
//  Created by Adriano Rezena on 29/08/21.
//

import XCTest
@testable import Book_Search

class SearchRepositoryTests: XCTestCase {

    var searchAPI: SearchAPIProtocol!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        searchAPI = MockSearchAPI()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchResponse() throws {
        let repository = SearchRepository(searchAPI: searchAPI)
        repository.fetchBooks(expression: "swiftui") { response in
            
            switch response {
            case .success(let books):
                XCTAssertTrue(books != nil)
                XCTAssertEqual(books?.count ?? 0, 3)
                XCTAssertEqual(books?.first?.key, "/works/OL21672804W")
                XCTAssertEqual(books?.first?.title, "SwiftUI for Dummies")
                XCTAssertEqual(books?.first?.isbn?[0], "1119652723")
                XCTAssertEqual(books?.first?.isbn?[1], "9781119652700")
                XCTAssertEqual(books?.first?.isbn?[2], "1119652707")
                XCTAssertEqual(books?.first?.isbn?[3], "9781119652724")
                XCTAssertEqual(books?.first?.author_name?[0], "Wei-Meng Lee")
                XCTAssertEqual(books?.first?.publish_year?[0], 2020)
                XCTAssertEqual(books?.first?.language?[0], "eng")
                
            case .failure(_):
                XCTFail()
                
            }
        }
    }

}



struct MockSearchAPI: SearchAPIProtocol {
    
    func fetchBooks(expression: String, onComplete: @escaping (NetworkManagerResponse) -> Void) {
        let data = File().loadStubFromBundle(withName: "search", extension: "json")
        onComplete(.success(data))
    }
    
}
