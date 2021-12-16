//
//  LoginViewController.swift
//  viary
//
//  Created by user on 16/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func login(_ sender: Any) {
        var valid = true
        
        if Helper.numberOfCharacters(str: usernameTextField.text!) == 0{
            valid = false
            
            let alert = Helper.makeAlert(msg: "Username cannot be empty", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)
            
        } else if Helper.numberOfCharacters(str: passwordTextField.text!) == 0 {
            valid = false
            
            let alert = Helper.makeAlert(msg: "Password cannot be empty", handler: nil, showCancel: false)
            present(alert, animated: false, completion: nil)

        }
        
        if valid {
            var authenticated = false
            
            //Check user data
            authenticated = true
            
            if authenticated {
                performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
}
