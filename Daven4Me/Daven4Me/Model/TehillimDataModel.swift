//
//  TehillimDataModel.swift
//  Daven4Me
//
//  Created by user on 6/23/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class TehillimDataModel {
    
    var chapters: [Chapter] = [Chapter]()
    
    init() {
        
    //load text file as one long string
    let tehillimTextURL = Bundle.main.url(forResource: "RawTehillimText", withExtension: ".txt")
    
    let textString = try! String(contentsOf: tehillimTextURL!)
    
    
    let splitByChapters = textString.components(separatedBy: "Chapter")
        
        for _ in splitByChapters {
            //let chap = Chapter(firstSentence)
        }
    
    //chapters = splitByChapters
        
    let chapter1 = splitByChapters[1]
    
    let chapter1Array = chapter1.components(separatedBy: "\n")
    let firstSentence = chapter1Array[0...2]
    print("the first sentence is \(firstSentence)")
    
    
    // separate text into arrays of chapters
    // get chapter119
    // split chapter119 into a dictionary of key value pairs
    // split each paragraph into an array of lines
    }
}
