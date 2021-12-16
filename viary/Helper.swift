//
//  Helper.swift
//  viary
//
//  Created by user on 16/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    public static func makeAlert (msg: String, handler: ((UIAlertAction)->Void)?, showCancel: Bool)->UIAlertController {
        //create alert
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .actionSheet)
        
        //create alert actions
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //add action to alert
        alert.addAction(okAction)
        if showCancel{
            alert.addAction(cancelAction)
        }
        
        return alert
    }
    
    public static func numberOfCharacters(str: String)-> Int{
        return str.count
    }
}
