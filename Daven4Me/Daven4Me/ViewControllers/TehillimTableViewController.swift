//
//  TehillimTableViewController.swift
//  Daven4Me
//
//  Created by user on 6/23/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class TehillimTableViewController: UITableViewController {

    var tehillimDataModel : TehillimDataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("the num of chapters is \(tehillimDataModel.chapters.count)")
        return tehillimDataModel.chapters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseId = "ChapterTableCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! ChapterTableCell
        
         let currentChapter = tehillimDataModel.chapters[indexPath.row]
        
         cell.chapterLabel.text = currentChapter.number

        return cell
    }
    

  

}
