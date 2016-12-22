//
//  Item+CoreDataProperties.swift
//  Done
//
//  Created by LA Argon on 12/22/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var createdAt: NSTimeInterval
    @NSManaged var done: Bool
    @NSManaged var name: String?
    @NSManaged var updatedAt: NSTimeInterval

}
