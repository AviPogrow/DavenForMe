//
//  PersonService.swift
//  Daven4Me
//
//  Created by user on 11/6/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class PersonService {
    
    var tehillimDataModel = TehillimDataModel()
    var tehillim119Dictionary = [String: String]()
    
    
    init() {
        tehillim119Dictionary = tehillimDataModel.tehillimDict
    }
    
    func createArrayOfPeople() -> Person {
        
        // 2 strings representing hebrew names
        
        let avrahamPinchus = "אברהם-פנחס-בן-מרים"
        //let sarahChana =  "שרה-חנה-בילא-בת-מרים-יוכבד"
        
        // convert raw strings to person objects
        let  person1 = createNewPersonFromName(name: avrahamPinchus)
        //let  person2 = createNewPersonFromName(name: sarahChana)
        
        
        return person1
      }
    
    
    func createNewPersonFromName(name: String) -> Person {
        
         
               var arrayOfLetters = [String]()
               // array to hold dic keys
               var keysArray = [String]()
               // array to hold kapitel strings
               var kapitArray = [String]()
               
               arrayOfLetters = createLettersArrayFromName(name: name)
               keysArray = createKeyArrayFromLettersArray(arrayOflettrs: arrayOfLetters)
               kapitArray = convertKeyArryToKapitArray(kapitlKeys: keysArray)
               
               // init the person instance and set its properties
        let person = Person(nameToDisplay: name,keysForDict: keysArray, lettersArray: arrayOfLetters, kapitelStringsArray: kapitArray,timeStame: Date())
               
               //person.nameToDisplay = name
               //person.lettersArray = arrayOfLetters
               //person.keysForDict = keysArray
               //person.kapitelStringsArray = kapitArray
               //person.timeStamp = Date()
               
               return person
           }
    
    
    func updatePersonFromName(name: String) {
        
    }



func createLettersArrayFromName(name: String) -> [String] {
    var lettersArray = [String]()
    
    for i in name {
        lettersArray.append(String(i))
    }
    return lettersArray
}

func createKeyArrayFromLettersArray(arrayOflettrs:[String]) -> [String] {
    var keysArray = [String]()
    // iterate over name string
    //convert each lettr
    // into a dict key and add it to an array of keys
    for (_, hebLetrr) in arrayOflettrs.enumerated() {
        
        var charString = ""
        if hebLetrr == "-"  {
             charString = "space"
        
       } else {
         charString = String(hebLetrr)
        }
        
        //lettersArray.append(charString)
        let rawValue = HebrewData.LetterHebrew.init(rawValue: charString)!
        
        let paragraphNumber = rawValue.convertToParagrahNumber(paragraphLetter: rawValue.rawValue)
        
        let dictKey = rawValue.createDictKey(paragraphNum: paragraphNumber)
        
        keysArray.append(dictKey)
    }
    
    return keysArray
}

// pass in an array of dict keys and convert it to an
 // array of kapitel strings
   func convertKeyArryToKapitArray(kapitlKeys:[String]) -> [String] {
     var  kapitelArray = [String]()
     
     for i in kapitlKeys {
        let paragraph = tehillim119Dictionary[i]!
         kapitelArray.append(paragraph)
     }
     
     return kapitelArray
 }


}
