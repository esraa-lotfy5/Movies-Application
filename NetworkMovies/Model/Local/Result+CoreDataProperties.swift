//
//  Result+CoreDataProperties.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 4/25/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//
//

import Foundation
import CoreData


extension Result {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Result> {
        return NSFetchRequest<Result>(entityName: "Result")
    }

    @NSManaged public var errorMessage: String?
    @NSManaged public var item: NSSet?

}

// MARK: Generated accessors for item
extension Result {

    @objc(addItemObject:)
    @NSManaged public func addToItem(_ value: Item)

    @objc(removeItemObject:)
    @NSManaged public func removeFromItem(_ value: Item)

    @objc(addItem:)
    @NSManaged public func addToItem(_ values: NSSet)

    @objc(removeItem:)
    @NSManaged public func removeFromItem(_ values: NSSet)

}
