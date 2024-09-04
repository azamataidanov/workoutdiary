//
//  WorkoutEntity+CoreDataProperties.swift
//  
//
//  Created by Azamat Aidanov on 03.09.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension WorkoutEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutEntity> {
        return NSFetchRequest<WorkoutEntity>(entityName: "WorkoutEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var repeats: Int32
    @NSManaged public var rounds: Int32
    @NSManaged public var title: String?

}

extension WorkoutEntity : Identifiable {

}
