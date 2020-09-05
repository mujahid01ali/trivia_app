//
//  TriviaData+CoreDataProperties.swift
//  
//
//  Created by Mujahid on 06/09/20.
//
//

import Foundation
import CoreData


extension TriviaData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TriviaData> {
        return NSFetchRequest<TriviaData>(entityName: "TriviaData")
    }

    @NSManaged public var cricketerName: String?
    @NSManaged public var dateT: String?
    @NSManaged public var flagColors: String?
    @NSManaged public var userName: String?

}
