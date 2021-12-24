//
//  LoginViewController.swift
//  viary
//
//  Created by user on 16/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        context = appDelegate.persistentContainer.viewContext
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func login(_ sender: Any) {
        var valid = true
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if Helper.numberOfCharacters(str: username) == 0{
            valid = false
            
            let alert = Helper.makeAlert(msg: "Username cannot be empty", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)
            
        } else if Helper.numberOfCharacters(str: password) == 0 {
            valid = false
            
            let alert = Helper.makeAlert(msg: "Password cannot be empty", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)

        }
        
        if valid {
            //Check user data
            if authenticateUser(username: username, password: password) {
                performSegue(withIdentifier: "goToMain", sender: self)
            } else {
                print("(INFO) Authenticate false")
            }
        }
    }
    
    func authenticateUser(username: String, password: String)->Bool {
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "AccountEntity")
        let predicate = NSPredicate(format: "username == %@", username)
        req.predicate = predicate
        
        var results = [NSManagedObject]()
        
        do {
            results = try context.fetch(req) as! [NSManagedObject]
        } catch {
            print("(ERROR) Error getting user data")
        }
        
        return results.count > 0
    }
}
