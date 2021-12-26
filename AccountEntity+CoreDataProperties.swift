//
//  AccountEntity+CoreDataProperties.swift
//  viary
//
//  Created by Andy Chen on 26/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//
//

import Foundation
import CoreData


extension AccountEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountEntity> {
        return NSFetchRequest<AccountEntity>(entityName: "AccountEntity")
    }

    @NSManaged public var idAccount: Double
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var diarys: NSOrderedSet?

}

// MARK: Generated accessors for diarys
extension AccountEntity {

    @objc(insertObject:inDiarysAtIndex:)
    @NSManaged public func insertIntoDiarys(_ value: DiaryEntity, at idx: Int)

    @objc(removeObjectFromDiarysAtIndex:)
    @NSManaged public func removeFromDiarys(at idx: Int)

    @objc(insertDiarys:atIndexes:)
    @NSManaged public func insertIntoDiarys(_ values: [DiaryEntity], at indexes: NSIndexSet)

    @objc(removeDiarysAtIndexes:)
    @NSManaged public func removeFromDiarys(at indexes: NSIndexSet)

    @objc(replaceObjectInDiarysAtIndex:withObject:)
    @NSManaged public func replaceDiarys(at idx: Int, with value: DiaryEntity)

    @objc(replaceDiarysAtIndexes:withDiarys:)
    @NSManaged public func replaceDiarys(at indexes: NSIndexSet, with values: [DiaryEntity])

    @objc(addDiarysObject:)
    @NSManaged public func addToDiarys(_ value: DiaryEntity)

    @objc(removeDiarysObject:)
    @NSManaged public func removeFromDiarys(_ value: DiaryEntity)

    @objc(addDiarys:)
    @NSManaged public func addToDiarys(_ values: NSOrderedSet)

    @objc(removeDiarys:)
    @NSManaged public func removeFromDiarys(_ values: NSOrderedSet)

}
