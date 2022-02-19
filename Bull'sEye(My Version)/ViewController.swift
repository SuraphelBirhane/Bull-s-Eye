//
//  ViewController.swift
//  Bull'sEye(My Version)
//
//  Created by Suraphel on 2/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var targetValue = 50
    var score = 0
    var round = 1
    var points = 0
    @IBAction func hitmeButton(_ sender: UIButton) {
        points = 100 - abs(targetValue - Int(slider.value))
        //FIXME: - add conditions for the corresponding title
        let message = "You Scored \(points)"
        if points == 100 {
            title = "Perfect!"
        }
        else if points >= 96 {
            title = "You almost had it!"
        }
        else if points >= 87 {
            title = "Pretty good!"
        }
        else {
            title = "Not even close..."
        }
        let alert = UIAlertController(title: title, message: message,  preferredStyle: .alert)
        let action = UIAlertAction(title: title, style: .default){_ in
            self.updateValue()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func startOverButton(_ sender: UIButton) {
        startNewGame()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
          name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    func updateValue(){
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(targetValue)
        score += points
        round += 1
        scoreLabel.text = "Score: \(score)"
        roundLabel.text = "Round: \(round)"
    }
    func startNewGame(){
        targetValue = Int.random(in: 1...100)
        targetLabel.text = String(targetValue)
        score = 0
        round = 1
        scoreLabel.text = "Score: \(score)"
        roundLabel.text = "Round: \(round)"
        slider.value = 50

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(
          named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
          withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
          withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        // Do any additional setup after loading the view.
    }


}

