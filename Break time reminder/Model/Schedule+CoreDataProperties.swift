//
//  Schedule+CoreDataProperties.swift
//  Break time reminder
//
//  Created by Damian Mikołajczak on 17/05/2021.
//
//

import Foundation
import CoreData


extension Schedule {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Schedule> {
        return NSFetchRequest<Schedule>(entityName: "Schedule")
    }

    @NSManaged public var endTime: Date?
    @NSManaged public var frequency: Int16
    @NSManaged public var isActive: Bool
    @NSManaged public var length: Int16
    @NSManaged public var name: String?
    @NSManaged public var startTime: Date?

}

extension Schedule : Identifiable {

}
