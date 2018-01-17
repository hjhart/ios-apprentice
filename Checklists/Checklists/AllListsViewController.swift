//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Wanelo Engineering on 1/16/18.
//  Copyright © 2018 Hart, Inc. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
  var lists = [Checklist]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    
    var list = Checklist(name: "Pizzas to Eat")
    lists.append(list)

    list = Checklist(name: "Groceries")
    lists.append(Checklist(name: "Groceries"))

    list = Checklist(name: "$1M Apps to Write")
    lists.append(list)
    
    list = Checklist(name: "To Do")
    lists.append(list)
    
    list = Checklist(name: "Naps to Take")
    lists.append(list)
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lists.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = makeCell(for: tableView)
    let list = lists[indexPath.row]
    cell.textLabel!.text = list.name
    cell.accessoryType = .detailDisclosureButton
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let checklist = lists[indexPath.row]
    performSegue(withIdentifier: "ShowChecklist", sender: checklist)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowChecklist" {
      let controller = segue.destination as! ChecklistViewController
      controller.checklist = sender as! Checklist
    }
  }


  func makeCell(for tableView: UITableView) -> UITableViewCell {
    let cellIdentifier = "Cell"
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
      return cell
    } else {
      return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
    }
  }
}
