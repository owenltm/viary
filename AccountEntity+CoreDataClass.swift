//
//  AccountEntity+CoreDataClass.swift
//  viary
//
//  Created by Andy Chen on 26/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//
//


import UIKit
import CoreData

@objc(AccountEntity)
public class AccountEntity: NSManagedObject {
    var diaries: [DiaryEntity]? {
        return self.diarys?.array as? [DiaryEntity]
    }
    
    convenience init?(idAccount: Double, password: String?, username: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: AccountEntity.entity(), insertInto: context)
        
        self.idAccount = idAccount 
        self.password = password
        self.username = username
    }
    
}
