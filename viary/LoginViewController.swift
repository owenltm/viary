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
    
    var authenticatedUser: AccountEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        context = appDelegate.persistentContainer.viewContext
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMain" {
            let dest = segue.destination as! HomeViewController
            
            dest.account2 = authenticatedUser
        }
    }
    
    func dismissKeyboard() {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
    @IBAction func editingEnd(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func login(_ sender: Any) {
        var valid = true
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if Helper.numberOfCharacters(str: username) == 6 {
            valid = false
            
            let alert = Helper.makeAlert(msg: "Username must be atleast 6 characters", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)
        } else if Helper.numberOfCharacters(str: password) == 8 {
            valid = false
            
            let alert = Helper.makeAlert(msg: "Password must be atleast 8 characters", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)
        }
        
        if valid {
            //Check user data
            if authenticateUser(username: username, password: password) {
                performSegue(withIdentifier: "goToMain", sender: self)
            } else {
                print("(INFO) Authenticate false")
                let alert = Helper.makeAlert(msg: "Invalid username and password", handler: nil, showCancel: false)
                present(alert, animated: false, completion: nil)
            }
        }
    }
    
    func authenticateUser(username: String, password: String)->Bool {
        
        let req: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        let predicate = NSPredicate(format: "username == %@", username)
        req.predicate = predicate
        
        var results = [AccountEntity]()
        
        do {
            results = try context.fetch(req)
            
            if results.count > 0 {
                if(password == results[0].password!){
                    authenticatedUser = results[0]
                } else {
                    let alert = Helper.makeAlert(msg: "Invalid password", handler: nil, showCancel: false)
                    present(alert, animated: false, completion: nil)
                }
            }
        } catch {
            print("(ERROR) Error getting user data")
            let alert = Helper.makeAlert(msg: "Error authenticating account", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)
        }
        
        return results.count > 0
    }
}
