//
//  Contact+CoreDataProperties.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 06/01/2021.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var userName: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?
    @NSManaged public var sex: String?
    @NSManaged public var country: String?

}

extension Contact : Identifiable {

}
