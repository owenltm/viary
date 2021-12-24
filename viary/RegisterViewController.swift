//
//  RegisterViewController.swift
//  viary
//
//  Created by Owen Lwiantoro on 16/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    let defaults = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        context = appDelegate.persistentContainer.viewContext
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let dest = segue.destination as! ViewController
    }
    
    @IBAction func registerUser(_ sender: Any) {
        var valid = true;
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text
        
        if Helper.numberOfCharacters(str: username) < 6 {
            // ALERT: username must be atleast 6 charactersvalid = false
            
            let alert = Helper.makeAlert(msg: "Ssername must be atleast 6 characters", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)

        } else if Helper.numberOfCharacters(str: password) < 8 {
            valid = false
            
            let alert = Helper.makeAlert(msg: "Password must be atleast 8 characters", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)
        } else if password != confirmPassword {
            valid = false
            
            let alert = Helper.makeAlert(msg: "Confirm password must match", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)
        }
        
        if valid {
            // REGISTER USER TO DB
            let userCount = defaults.double(forKey: "userCount")
            //print("test: \(test)")
            
            let entity = NSEntityDescription.entity(forEntityName: "AccountEntity", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            
            newUser.setValue(userCount, forKey: "idAccount")
            newUser.setValue(username, forKey: "username")
            newUser.setValue(password, forKey: "password")
            
            do {
                try context.save()
                print("(INFO) New user created")
                
//                registeredUser = User(idUser: userCount, username: username, password: password)
                defaults.setValue(userCount + 1, forKey: "userCount")
                
                performSegue(withIdentifier: "backToWelcome", sender: self)
            } catch {
                print("(ERROR) New user created")
            }
        }
    }
    
}
