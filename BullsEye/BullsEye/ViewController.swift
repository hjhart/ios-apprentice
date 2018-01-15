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
    startNewRound()
    setUpSliderGraphics()
  }
  
  func setUpSliderGraphics() {
    let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, for: .normal)

    let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    let trackLeftImage = UIImage(named: "SliderTrackLeft")!
    let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackRightImage = UIImage(named: "SliderTrackRight")!
    let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)

  }
  
  func startNewRound() {
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
  
  @IBAction func startOver() {
    score = 0
    round = 0
    startNewRound()
  }
  
  @IBAction func ShowAlert() {
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference
    
    let title: String
    if difference == 0 {
      points += 100
      title = "Perfect!"
    } else if difference < 5 {
      title = "You almost had it!"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "I've had better."
    } else {
      title = "Not even close."
    }
    
    score = score + points
    let message = "You guessed \(currentValue)" +
                  "\nYou scored \(points) points"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Right-o!", style: .default, handler: { action in self.startNewRound() })
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
}


