//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Wanelo Engineering on 1/15/18.
//  Copyright © 2018 Hart, Inc. All rights reserved.
//

import Foundation

class ChecklistItem {
  var text = ""
  var checked = false
  
  func toggleChecked() {
    checked = !checked
  }
}
