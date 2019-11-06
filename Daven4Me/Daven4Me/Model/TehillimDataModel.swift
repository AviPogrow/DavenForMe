//
//  TehillimDataModel.swift
//  Daven4Me
//
//  Created by user on 6/23/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class TehillimDataModel: Codable {
    
    var tehillimDict = [String: String]()
    
    init() {
       setUpTehillimDict()
    }
        
  
    func setUpTehillimDict() {
        let chapters = createArrayOfTehillimChapters()
                     
                     
         tehillimDict = createDictionaryNamesToChapters(chapters: chapters)
       
        
       
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(tehillimDict)
        

        _ = String(data: jsonData, encoding: .utf8)!
      
    }
    
 
    func createArrayOfTehillimChapters() -> [String] {
    
        //load text file as one long string
       let tehillimTextURL = Bundle.main.url(forResource: "Chapter119Plain", withExtension: ".txt")
       
       let textString = try! String(contentsOf: tehillimTextURL!)
       
      
       let splitByChapters = textString.components(separatedBy: ".")
        
        return splitByChapters
    }
    // passing in an ordered list of paragraphs set up a dictionary
        func createDictionaryNamesToChapters(chapters: [String]) -> [String: String] {
      
          var namesToParagraphs = [String: String]()
         
          //loop through and create dictionry with keys
          for (index, hebLetrr) in  HebrewData.LetterHebrew.allCases.enumerated() {
        
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
    
func                                                                convArryKeysToArryKapits(kapitlKeys: [String]) -> [String] {
                            
        var  kapitelArray = [String]()
        
        for i in kapitlKeys {
            let paragraph = tehillimDict[i]!
            kapitelArray.append(paragraph)
        }
        
        return kapitelArray
    }
}
                                                               
