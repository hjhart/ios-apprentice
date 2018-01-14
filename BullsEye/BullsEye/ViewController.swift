//
//  ViewController.swift
//  BullsEye
//
//  Created by Wanelo Engineering on 1/13/18.
//  Copyright © 2018 Hart, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShowAlert() {
        let alert = UIAlertController(title: "Hello, Butts.", message: "Butts butts butts", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome Sauce", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}


