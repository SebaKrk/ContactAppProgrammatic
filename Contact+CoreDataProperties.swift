//
//  Contact+CoreDataProperties.swift
//  ContactAppProgrammatic
//
//  Created by Sebastian Sciuba on 07/01/2021.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var contactImg: Data?
    @NSManaged public var country: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var sex: String?
    @NSManaged public var userName: String?
    @NSManaged public var countryImg: Data?

}

extension Contact : Identifiable {

}
