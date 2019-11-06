//
//  HebrewData.swift
//  Daven4Me
//
//  Created by user on 6/15/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation


struct HebrewData {
    
    // enum does several things
    // 1. provides an array of letters for keyboard scene
    // collectionView data model (case iterable)
    // 2. allows us to iterate over a hebrew string and
    //  convert each letter to a dictionary key
    // that holds a page of text. This is essential
    // for converting a hebrew string in a text field into
    // a complete person object
    enum LetterHebrew: String, CaseIterable  {
        case א
        case ב
        case ג
        case ד
        case ה
        case ו‍
        case ז
        case ח
        case ט
        case י
        case כ
        case ך
        case ל
        case מ
        case ם
        case נ
        case ן
        case ס
        case ע
        case פ
        case ף
        case צ
        case ץ
        case ק
        case ר
        case ש
        case ת
        case space
        
        
        
    var asDictKey: String {
           return "Chapter119-" + "Paragraph-" +  "\(rawValue)"
       }
    
    
    // pass in a letter as a string and return a number
    // given a letter as a raw value string convert it into an Int
    func convertToParagrahNumber(paragraphLetter: String) -> String {
        
        switch paragraphLetter {
        case "א": return "1"
        case "ב": return "2"
        case "ג": return "3"
        case "ד": return "4"
        case "ה" : return "5"
        case "ו‍" : return "6"
        case "ז" : return "7"
        case "ח" : return "8"
        case "ט" : return "9"
        case  "י": return "10"
        case "כ" : return "11"
        case "ך" : return "11"
        case "ל" : return "13"
        case "מ" : return "14"
        case "ם" : return "14"
        case "נ" : return "16"
        case "ן" : return "16"
        case "ס" : return "18"
        case "ע" : return "19"
        case "פ" : return "20"
        case "ף" : return "20"
        case "צ" : return "22"
        case "ץ" : return "22"
        case "ק" : return "24"
        case "ר" : return "25"
        case "ש" : return "26"
        case "ת" : return "27"
        case "space" : return "space"
        default:
            return ""
        }
    }
    

    func createDictKey(paragraphNum: String) -> String {
           return "Chapter-119-" + "Paragraph-" + paragraphNum
       }
   


    func createArrayOfKapitelIDentifiers() -> [String] {
        var  kapitelIds = [String]()
    //loop through and create dictionry with keys
        for (_, hebLetrr) in LetterHebrew.allCases.enumerated() {
        
        // convert to its string
        let rawVlue = hebLetrr.rawValue
        
        // convert to paragraph num
        let paragraphNumber = hebLetrr.convertToParagrahNumber(paragraphLetter: rawVlue)
        let dictKey = hebLetrr.createDictKey(paragraphNum: paragraphNumber)
        kapitelIds.append(dictKey)
        }
        return kapitelIds
    }

    // passing in an ordered list of paragraphs set up a dictionary
        func createDictionaryNamesToChapters(chapters: [String]) -> [String: String] {
      
          var namesToParagraphs = [String: String]()
        
          //loop through and create dictionry with keys
          for (index, hebLetrr) in LetterHebrew.allCases.enumerated() {
        
           // convert to its string
              let rawVlue = hebLetrr.rawValue
              
              // convert to paragraph num
              let paragraphNumber = hebLetrr.convertToParagrahNumber(paragraphLetter: rawVlue)
              let dictKey = hebLetrr.createDictKey(paragraphNum: paragraphNumber)
            
            // create unique dict key for letter
           let dictionaryKey = dictKey
        
           // add the key to the dictionary and set
            // its value to the current
           namesToParagraphs[dictionaryKey] = chapters[index]
        }
        
        return namesToParagraphs
    }
    

        func convertKeyArryToKapitArray(kapitlKeys:[String]) -> [String] {
      var  kapitelArray = [String]()
            let tehillimDict = TehillimDataModel().tehillimDict
      for i in kapitlKeys {
          let paragraph = tehillimDict[i]!
          kapitelArray.append(paragraph)
      }
      
      return kapitelArray
  }

}
}

