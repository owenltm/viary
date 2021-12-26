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
    
    var account: AccountEntity?
    
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
        let title = DTitle.text
        let content = DContent.text
        let date = Date()
        DTitle.text = "test"
        //        let date = Date()
        //        let formater = DateFormatter()
        //        formater.dateFormat = "dd.MM.yyyy"
        //        let result = formater.string(from: date)
        
        if let diaries = DiaryEntity(id: 1, title: title, content: content, date1: date){
            account?.addToDiarys(diaries)
            do{
                try diaries.managedObjectContext?.save()
                 DTitle.text = "test"
            }catch{
                
            }
        }
    }
    
    
    @IBAction func ToHome(_ sender: Any) {
        
    }
    
    
    
}
