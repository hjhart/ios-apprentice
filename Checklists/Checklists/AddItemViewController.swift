//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Wanelo Engineering on 1/15/18.
//  Copyright © 2018 Hart, Inc. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
  func addItemViewControllerDidCancel(_ controller: AddItemViewController)
  func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)

}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneBarButton: UIBarButtonItem!
  weak var delegate: AddItemViewControllerDelegate?
  
  @IBAction func cancel() {
    delegate?.addItemViewControllerDidCancel((self))
  }

  @IBAction func done() {
    let item = ChecklistItem()
    item.text = textField.text!
    item.checked = false
    delegate?.addItemViewController(self, didFinishAdding: item)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    textField.becomeFirstResponder()
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let oldText = textField.text!
    let stringRange = Range(range, in: oldText)!
    let newText = oldText.replacingCharacters(in: stringRange, with: string)
    
    print("The new text is '\(newText)'")
    doneBarButton.isEnabled = !newText.isEmpty
    
    return true
  }
}
