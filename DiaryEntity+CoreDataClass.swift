//
//  DiaryEntity+CoreDataClass.swift
//  viary
//
//  Created by Andy Chen on 26/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//
//


import UIKit
import CoreData

@objc(DiaryEntity)
public class DiaryEntity: NSManagedObject {
    var date1: Date?{
        get{
            return date as Date?
        }
        set{
            date = newValue as NSDate?
        }
    }
    
    convenience init?(id: Double, title: String?, content: String?, date1: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: DiaryEntity.entity(), insertInto: context)
        
        self.id = id
        self.title = title
        self.content = content
        self.date1 = date1
    }
}
