//
//  DBManager.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 06/01/2021.
//


import UIKit
import CoreData

class DBManger {
    
    static let share = DBManger()
    
    lazy var persistentContainer: NSPersistentContainer = {
     
        let container = NSPersistentContainer(name: "ContactAppProgrammatic")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
       
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    lazy var  context = persistentContainer.viewContext
    
    func saveContext () {
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
    
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchContact() -> [Contact] {
        
        var contact = [Contact]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Contact.description())
        
        do {
            contact = try context.fetch(fetchRequest) as! [Contact]
        } catch {
            print("fetyching error")
        }
        return contact
    }
}

