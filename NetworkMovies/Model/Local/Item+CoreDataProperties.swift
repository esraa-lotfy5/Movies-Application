//
//  Item+CoreDataProperties.swift
//  NetworkMovies
//
//  Created by Esraa Lotfy  on 4/25/22.
//  Copyright © 2022 Esraa Lotfy . All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var gross: String?
    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var rank: String?
    @NSManaged public var title: String?
    @NSManaged public var weekend: String?
    @NSManaged public var weeks: String?
    @NSManaged public var relatedToResult: Result?

}
