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
    var existingDiary: DiaryEntity?
    @IBOutlet weak var DiaryTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DContent.layer.borderColor = UIColor.black.cgColor
        DContent.textColor = .lightGray
        DContent.text = "Write your content here"
        DContent.delegate = self
        
        DTitle.text = existingDiary?.title
        if ((existingDiary?.content) != nil){
            DContent.text = existingDiary?.content
            DiaryTitle.text = "Edit"
        }
        if(DContent.text != "Write your content here"){
            DContent.textColor = .black
        }
    }
    
    func alert(title:String ,msg:String, handler:((UIAlertAction)->Void)?){
        let alert = UIAlertController(title:title, message: msg, preferredStyle: .actionSheet)
        let okaction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.view.backgroundColor = UIColor.white
        alert.addAction(okaction)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DContent.resignFirstResponder()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray && DContent.text == "Write your content here" {
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
       
        var ediary: DiaryEntity?
        if let existingDiary = existingDiary{
            existingDiary.title = title
            existingDiary.content = content
            
            ediary = existingDiary
        }
        else {
            ediary = DiaryEntity(id: 1, title: title, content: content, date1: date)
            
        }
        
        
        //        let date = Date()
        
        if  title == "" {
            alert(title: "Fail", msg: "Please fill the title", handler: nil)
        }
        else if content!.count < 50 {
            alert(title: "Fail", msg: "Content must be at least 50 characters", handler: nil)
            
        } else{
            if let diaries = ediary{
                account?.addToDiarys(diaries)
                do{
                    try diaries.managedObjectContext?.save()
                    alert(title: "Success", msg: "Diary has been saved", handler: nil)
                    DTitle.text = ""
                    DContent.text = ""
                }catch{
                    
                }
            }
        }
        
        
    }
    
    
    @IBAction func ToHome(_ sender: Any) {
        performSegue(withIdentifier: "ToHome", sender: self)
    }
    
    @IBAction func ToProfile(_ sender: Any) {
        performSegue(withIdentifier: "ToProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToHome" {
            let dest = segue.destination as! HomeViewController
            dest.account2 = account
        }
        else if segue.identifier == "ToProfile"{
            let dest = segue.destination as! ProfileViewController
            dest.account = account
        }
    }
    
    
    
    
}
