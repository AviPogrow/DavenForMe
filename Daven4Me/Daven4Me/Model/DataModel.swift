//
//  DataModel.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

class DataModel {
  
    var peopleArray =  [Person]()
    
    init() {
     loadPeopleFromDisk()
     registerDefaults()
     handleFirstTime()
     
    }
    
    // create a unique ID and save it  to user defaults
    class func personID() -> Int {
        let userDefaults = UserDefaults.standard
        let itemID = userDefaults.integer(forKey: "PersonID")
        userDefaults.set(itemID + 1, forKey: "PersonID")
        userDefaults.synchronize()
        return itemID
    }
    
    // create a defaults dictionary and register it with user defaults
    func registerDefaults() {
        let dictionary = [ "PersonIndex": -1, "FirstTime": true ] as [String : Any]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func handleFirstTime() {
      let userDefaults = UserDefaults.standard
      let firstTime = userDefaults.bool(forKey: "FirstTime")
        
      if firstTime {
      peopleArray =  createArrayOfPeople()
            
       //indexOfSelectedChecklist = 0
       userDefaults.set(false, forKey: "FirstTime")
       userDefaults.synchronize()
      }
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent(
            "Person.plist")
    }
   
    func savePeopleToDisk() {
        let encoder = PropertyListEncoder()
        do {
             let data = try encoder.encode(peopleArray)
             try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadPeopleFromDisk()  {
      let path = dataFilePath()
      if let data = try? Data(contentsOf: path) {
        let decoder = PropertyListDecoder()
          do {
            peopleArray = try decoder.decode([Person].self, from: data)
            //sortPeople()
            } catch {
             print("Error decoding list array: \(error.localizedDescription)")
           }
        }
       
    }
    
     func createArrayOfPeople() -> [Person] {
        
        // 2 strings representing hebrew names
        let avrahamPinchus = "אברהם פנחס בן מרים"
        let sarahChana =  "שרה חנה בילא בת מרים יוכבד"
        
        // convert raw strings to person objects
        let  person1 = Person().convertNameToPerson(name: avrahamPinchus)
        let  person2 = Person().convertNameToPerson(name: sarahChana)
        // add person objects to array
        let peopleArray = [person1, person2]
        
        return peopleArray
      }
    }
   

