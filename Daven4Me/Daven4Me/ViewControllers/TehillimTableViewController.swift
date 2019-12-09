//
//  TehillimTableViewController.swift
//  Daven4Me
//
//  Created by user on 6/23/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class TehillimTableViewController: UITableViewController {

    var tehillimDataModel  = TehillimDataModel()
    //var chapters = [TehillimChapter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //chapters = tehillimDataModel.tehillimChapters
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return 1
        //return tehillimDataModel.chapters.count
    }

    
   // override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       // let cell = UITableViewCell()
        
       /// let reuseId = "ChapterTableCell"
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! ChapterTableCell
        
         //let currentChapter = tehillimDataModel.chapters[indexPath.row]
        //print("the state of current chapter is \(currentChapter)")
        //cell.chapterLabel.text = currentChapter
        //cell.firstVerseLabel.text = currentChapter

      //  return cell
   // }
    

  

}
