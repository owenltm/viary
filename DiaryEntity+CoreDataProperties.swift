//
//  DiaryEntity+CoreDataProperties.swift
//  viary
//
//  Created by Andy Chen on 26/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//
//

import Foundation
import CoreData


extension DiaryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryEntity> {
        return NSFetchRequest<DiaryEntity>(entityName: "DiaryEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var id: Double
    @NSManaged public var accounts: AccountEntity?

}
