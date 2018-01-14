//
//  ViewController.swift
//  BullsEye
//
//  Created by Wanelo Engineering on 1/13/18.
//  Copyright © 2018 Hart, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var currentValue: Int = 50
  var targetValue: Int = 0
  var score: Int = 0
  var round: Int = 0
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var slider: UISlider!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    startRound()
  }
  
  func startRound() {
    round += 1
    currentValue = 50
    slider.value = Float(currentValue)
    targetValue = 1 + Int(arc4random_uniform(100))
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func SliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func ShowAlert() {
    let difference = abs(targetValue - currentValue)
    let points = 100 - difference
    score = score + points
    let message = "The value of the slider is: \(currentValue)" +
                  "\nYou scored \(points) points"
    
    let alert = UIAlertController(title: "Hello, Butts.", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Right-o!", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    startRound()

  }
  
}


