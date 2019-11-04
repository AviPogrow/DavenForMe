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
    }


    // passing in an ordered list of paragraphs set up a dictionary
    func createDictionaryNamesToChapters(chapters: [String]) -> [String: String] {
  
      var namesToParagraphs = [String: String]()
    
      //loop through and create dictionry with keys
      for (index, hebLetrr) in LetterHebrew.allCases.enumerated() {
    
       let dictionaryKey = hebLetrr.asDictKey
    
       namesToParagraphs[dictionaryKey] = chapters[index]
    }
    
    return namesToParagraphs
}

}

