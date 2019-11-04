//
//  Person.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class  Person: NSObject,  Codable {
    
    var nameToDisplay: String = ""
    var lettersArray =  [String]()
    var keysForDict  = [String]()
    var timeStamp = Date()
     var itemID = -1
    
    override init() {
        super.init()
      itemID =   DataModel.personID()
    }

    
    // we won't have a person object instatiated until after
    // this function does its work so we use a static func to
    // convert name string into a person object
     func convertNameToPerson(name: String) -> Person  {
        
        var lettersArray = [String]()
        
        //split name into arrray of letters
        let charsArray = Array(name)
        
        // array to hold dic keys
        var keysArray = [String]()
        
        // iterate over name string
        //convert each lettr
        // into a dict key and add it to an array of keys
        for i in charsArray {
            
            let lettrStr = String(i)
            
            lettersArray.append(lettrStr)
            
            if let lettrKey = HebrewData.LetterHebrew.init(rawValue: lettrStr)?.asDictKey  {
                keysArray.append(lettrKey)
            }
                
            else {
                let lettrKey = HebrewData.LetterHebrew.init(rawValue: "space")?.asDictKey
                keysArray.append(lettrKey!)
            }
            
            
            
        }
        
        // init the person instance and set its properties
        let person = Person()
        person.nameToDisplay = name
        person.lettersArray = lettersArray
        person.keysForDict = keysArray
        person.timeStamp = Date()
        
        return person
    }
    
    
 }

class Mispaleli:  NSObject, Decodable {
    
    var displayStringForName: String
    var hebrewLettersArray: [String]
    var kapitelStringsArray: [String]
    
    init(displayStringForName: String, hebrewLettersArray: [String], kapitelStringsArray: [String]) {
        
        self.displayStringForName = displayStringForName
        self.hebrewLettersArray = hebrewLettersArray
        self.kapitelStringsArray = kapitelStringsArray
        
    }
}
