//
//  CreateEditViewController.swift
//  viary
//
//  Created by Andy Chen on 10/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class CreateEditViewController: UIViewController, UITextViewDelegate {


    @IBOutlet weak var DTitle: UITextField!
    @IBOutlet weak var DContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DContent.layer.borderColor = UIColor.black.cgColor
        DContent.textColor = .lightGray
        DContent.text = "Write your content here"
        DContent.delegate = self

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DContent.resignFirstResponder()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.textColor = .lightGray
            textView.text = "Write your content here"
        }
    }
    
    @IBAction func save(_ sender: Any) {
        
    }
    
  
    
}
