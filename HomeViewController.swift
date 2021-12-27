//
//  HomeViewController.swift
//  viary
//
//  Created by Hendry Gunawan on 10/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var diary = [String]()
    var account2: AccountEntity?
    
    @IBOutlet var diaryTable: UITableView!
    @IBOutlet weak var testing: UILabel!
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                let account = AccountEntity(idAccount: 1, password: "andy", username: "andy")
//
//                do {
//                    try account?.managedObjectContext?.save()
//                } catch  {
//
//                }
        diaryTable.dataSource = self
        diaryTable.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fecthRequest: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
//        
//        do {
//            account =  try managedContext.fetch(fecthRequest)
//        } catch  {
//
//        }
       
        
        self.diaryTable.reloadData()
        
    }
    
    @IBAction func ToCreate(_ sender: Any) {
        performSegue(withIdentifier: "ToCreate", sender: self)
    }
    
    @IBAction func ToProfile(_ sender: Any) {
        performSegue(withIdentifier: "ToProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToCreate" {
            guard let destination = segue.destination as? CreateEditViewController else{
                return
            }
            destination.account = account2
        }
        else if segue.identifier == "ToProfile" {
            guard let destination = segue.destination as? ProfileViewController else{
                return
            }
            destination.account = account2
        }
        else if segue.identifier == "ToEdit"{
            guard let destination = segue.destination as? CreateEditViewController ,
                let selectedRow = self.diaryTable.indexPathForSelectedRow?.row else {
                    return
            }
            destination.existingDiary = account2!.diaries?[selectedRow]
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteDiary(at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToEdit", sender: self)
    }
    
    func deleteDiary(at indexPath: IndexPath){
        guard let Ddiary = account2?.diaries?[indexPath.row],
            let managedContext = Ddiary.managedObjectContext else {
                return
        }
        managedContext.delete(Ddiary)
        do {
            try managedContext.save()
            
            diaryTable.reloadData()
        } catch  {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account2?.diarys?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let diaryCell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath)
        if let diaries = account2?.diaries?[indexPath.row] {
            diaryCell.textLabel?.text = diaries.title
            if let date = diaries.date1{
                dateFormatter.dateFormat = "dd/MM/yyyy"
                let result = dateFormatter.string(from: date)
                diaryCell.detailTextLabel?.text = result
            }
        }
        
        diaryCell.contentView.layer.cornerRadius = 10.0
        
        return diaryCell
    }
    
}
