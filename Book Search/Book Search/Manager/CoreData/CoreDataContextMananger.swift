//
//  CoredataContextMananger.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import Foundation
import CoreData


class CoreDataContextMananger {

    static let shared = CoreDataContextMananger()
    private init() {}
    
    var context: NSManagedObjectContext?
    
}
