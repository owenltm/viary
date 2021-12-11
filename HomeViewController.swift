//
//  HomeViewController.swift
//  viary
//
//  Created by Hendry Gunawan on 10/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    var diary = [String]()
    
    @IBOutlet var diaryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let diaryCell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath)
        
        diaryCell.contentView.layer.cornerRadius = 10.0
        
        return diaryCell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
