//
//  XCTestCase.swift
//  Book SearchTests
//
//  Created by Adriano Rezena on 29/08/21.
//

import XCTest
import Foundation

class File: NSObject {
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: name, withExtension: `extension`)

        return try! Data(contentsOf: url!)
    }
    
}

extension XCTestCase {
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        return File().loadStubFromBundle(withName: name, extension: `extension`)
    }

}
