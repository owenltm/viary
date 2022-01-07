//
//  ProfileViewController.swift
//  viary
//
//  Created by Andy Chen on 09/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var TotalDiary: UITextField!
    @IBOutlet weak var PUsername: UITextField!
    var account: AccountEntity!
    override func viewDidLoad() {
        super.viewDidLoad()
        PUsername.text = account.username
        TotalDiary.text = "\(account.diaries?.count ?? 0) diaries"
    }
    

    
    @IBAction func ToHome(_ sender: Any) {
        performSegue(withIdentifier: "ToHome", sender: self)
    }
    
    
    @IBAction func ToCreate(_ sender: Any) {
        performSegue(withIdentifier: "ToCreate", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToHome"{
            let dest = segue.destination as! HomeViewController
            dest.account2 = account
        }
        else if segue.identifier == "ToCreate"{
            let dest = segue.destination as! CreateEditViewController
            dest.account = account
        }
        
    }
    
}
