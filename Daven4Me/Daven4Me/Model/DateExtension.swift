//
//  DateExtension.swift
//  Daven4Me
//
//  Created by user on 11/13/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation



//let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24)


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
      return "\(secondsAgo / minute) minutes ago"
    } else if secondsAgo < day {
      return "\(secondsAgo / hour) hours ago"
    } else if secondsAgo < week {
      return "\(secondsAgo / day) days ago"
    }
    
    return "\(secondsAgo / week) weeks ago"
  }
}
