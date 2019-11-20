//
//  Person.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class  Person: NSObject, Codable {
    
    var nameToDisplay: String = ""
    var lettersArray =  [String]()
    var keysForDict  = [String]()
    var kapitelStringsArray = [String]()
    var timeStamp = Date()
     var itemID = -1
    var lastLetterRead = 0
    
    
    init(nameToDisplay: String, keysForDict:[String], lettersArray: [String], kapitelStringsArray: [String], timeStame: Date) {
           
          self.nameToDisplay = nameToDisplay
           self.lettersArray = lettersArray
          self.kapitelStringsArray = kapitelStringsArray
          self.timeStamp = Date()
           
       }

 }


