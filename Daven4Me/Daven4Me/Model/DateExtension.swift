//
//  DateExtension.swift
//  Daven4Me
//
//  Created by user on 11/13/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

//let dateString = pastDate.timeAgoDisplay()
extension Date {
  func timeAgoDisplay() -> String {
    let secondsAgo = Int(Date().timeIntervalSince(self))
    
    let minute = 60
    let hour = 60 * minute
    let day = 24 * hour
    let week = 7 * day
    
    if secondsAgo < minute {
      return "\(secondsAgo) seconds ago"
    } else if secondsAgo < hour {
      return "\(secondsAgo / minute) minute(s) ago"
    } else if secondsAgo < day {
      return "\(secondsAgo / hour) hour(s) ago"
    } else if secondsAgo < week {
      return "\(secondsAgo / day) day(s) ago"
    }
    
    return "\(secondsAgo / week) week(s) ago"
  }
}
