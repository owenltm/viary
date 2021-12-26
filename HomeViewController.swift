//
//  HomeViewController.swift
//  viary
//
//  Created by Hendry Gunawan on 10/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDataSource {
    
    var diary = [String]()
    var account: [AccountEntity] = []
    var account2: AccountEntity?
    
    @IBOutlet var diaryTable: UITableView!
    @IBOutlet weak var testing: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                let account = AccountEntity(idAccount: 1, password: "andy", username: "andy")
        
                do {
                    try account?.managedObjectContext?.save()
                } catch  {
        
                }
        diaryTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fecthRequest: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        
        do {
            account =  try managedContext.fetch(fecthRequest)
        } catch  {
            
        }
        //        testing.text = account[0].username
        account2 = account[0]
        
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
            destination.account = account[0]
        }
        else if segue.identifier == "ToProfile" {
            
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
                diaryCell.detailTextLabel?.text = "11/2/2002"
            }
        }
        
        diaryCell.contentView.layer.cornerRadius = 10.0
        
        return diaryCell
    }
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
}
