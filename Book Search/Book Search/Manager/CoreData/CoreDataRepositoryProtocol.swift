//
//  CoreDataRepositoryProtocol.swift
//  Book Search
//
//  Created by Adriano Rezena on 29/08/21.
//

import CoreData


protocol CoreDataRepositoryProtocol {
    
}


extension CoreDataRepositoryProtocol {
    
    func saveContext(_ context: NSManagedObjectContext) {
        
        do {
            try context.save()
            Log.database("Saved CoreData context")
        } catch {
            Log.e("Failed to save the CoreData context")
        }
        
    }
    
    
    func fetchData<T:NSManagedObject>(entity: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil, context: NSManagedObjectContext) -> [T] {

        let fetchRequest = T.fetchRequest()
        
        do {
            if predicate != nil {
                fetchRequest.predicate = predicate
            }
            
            if let sortDescriptors = sortDescriptors {
                fetchRequest.sortDescriptors = sortDescriptors
            }
            
            let result = try context.fetch(fetchRequest)
            Log.database("fetched \(result.count) \(entity.description())")
            
            return result as! [T]
        } catch {
            Log.e("Error fetching CoreData \(entity) Type. \(error.localizedDescription)")
            return []
        }
        
    }
    
}
