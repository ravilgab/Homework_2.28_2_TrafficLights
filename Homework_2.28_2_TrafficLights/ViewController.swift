//
//  ViewController.swift
//  Homework_2.28_2_TrafficLights
//
//  Created by Ravil on 15.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Lights {
        case red
        case yellow
        case green
    }

    let lightsOn: Float = 1
    let lightsOff: Float = 0.2
    var currentColor: Lights = .green
    
    @IBOutlet weak var redLabel: UIView!
    @IBOutlet weak var yellowLabel: UIView!
    @IBOutlet weak var greenLabel: UIView!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLabel.layer.opacity = lightsOff
        yellowLabel.layer.opacity = lightsOff
        greenLabel.layer.opacity = lightsOff
        
        startButtonOutlet.layer.cornerRadius = 9
    }
    
    override func viewDidLayoutSubviews() {
        redLabel.layer.cornerRadius = redLabel.layer.bounds.width / 2
        yellowLabel.layer.cornerRadius = yellowLabel.layer.bounds.width / 2
        greenLabel.layer.cornerRadius = greenLabel.layer.bounds.width / 2
    }

    @IBAction func startButtonPressed() {
        startButtonOutlet.setTitle("Next", for: .normal)
        
        switch currentColor {
        case .red:
            redLabel.layer.opacity = lightsOff
            yellowLabel.layer.opacity = lightsOn
            currentColor = .yellow
        case .yellow:
            yellowLabel.layer.opacity = lightsOff
            greenLabel.layer.opacity = lightsOn
            currentColor = .green
        case .green:
            greenLabel.layer.opacity = lightsOff
            redLabel.layer.opacity = lightsOn
            currentColor = .red
        }
    }
    
}

