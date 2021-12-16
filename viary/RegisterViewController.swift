//
//  RegisterViewController.swift
//  viary
//
//  Created by Owen Lwiantoro on 16/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let dest = segue.destination as! ViewController
    }
    
    @IBAction func registerUser(_ sender: Any) {
        var valid = true;
        
        if Helper.numberOfCharacters(str: usernameTextField.text!) < 6 {
            // ALERT: username must be atleast 6 characters
            
            valid = false
        }
        
        if Helper.numberOfCharacters(str: passwordTextField.text!) < 6 {
            // ALERT: password must be atleast 8 characters
            
            valid = false
        }
        
        if passwordTextField.text != confirmPasswordTextField.text {
            // ALERT: Password must match
            
            valid = false
        }
        
        if valid {
            // REGISTER USER TO DB
            
            performSegue(withIdentifier: "backToWelcome", sender: self)
        }
    }
    
}
