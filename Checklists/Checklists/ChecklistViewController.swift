//
//  ViewController.swift
//  Checklists
//
//  Created by Wanelo Engineering on 1/14/18.
//  Copyright © 2018 Hart, Inc. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

  var items: [ChecklistItem]
  
  required init?(coder aDecoder: NSCoder) {
    items = [ChecklistItem]()
    
    let row0item = ChecklistItem()
    row0item.text = "Walk the dog"
    row0item.checked = false
    items.append(row0item)

    let row1item = ChecklistItem()
    row1item.text = "Butts butts butts"
    row1item.checked = true
    items.append(row1item)

    super.init(coder: aDecoder)
  }
  
  func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
    if item.checked {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      let item = items[indexPath.row]
      item.checked = !item.checked
      configureCheckmark(for: cell, with: item)
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    let label = cell.viewWithTag(1000) as! UILabel
    
    let item = items[indexPath.row]
    label.text = item.text
    configureCheckmark(for: cell, with: item)
    return cell
  }
  
}

