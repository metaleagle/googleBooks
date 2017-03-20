//
//  Volume+CoreDataProperties.swift
//  
//
//  Created by Андрей Данишевский on 18.03.17.
//
//

import Foundation
import CoreData


extension Volume {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Volume> {
        return NSFetchRequest<Volume>(entityName: "Volume");
    }

    @NSManaged public var volumeID: String?
    @NSManaged public var title: String?
    @NSManaged public var authors: [String]?
    @NSManaged public var coverData: NSData?
    @NSManaged public var volumeDescription: String?
    @NSManaged public var thumbURL: String?
    @NSManaged public var infoLink: String?

}
