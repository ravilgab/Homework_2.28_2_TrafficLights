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
    let buttonCornerRadius: CGFloat = 9
    var currentColor: Lights = .green
    
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.layer.opacity = lightsOff
        yellowLightView.layer.opacity = lightsOff
        greenLightView.layer.opacity = lightsOff
        
        startButtonOutlet.layer.cornerRadius = buttonCornerRadius
        resetButtonOutlet.layer.cornerRadius = buttonCornerRadius
        
        resetButtonOutlet.layer.backgroundColor = UIColor.systemGray.cgColor
    }
    
    override func viewDidLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.layer.bounds.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.layer.bounds.width / 2
        greenLightView.layer.cornerRadius = greenLightView.layer.bounds.width / 2
    }

    @IBAction func startButtonPressed() {
        startButtonOutlet.setTitle("Next", for: .normal)
        
        resetButtonOutlet.layer.backgroundColor = #colorLiteral(red: 0, green: 0.300072529, blue: 0.6560639881, alpha: 1)
        
        switch currentColor {
        case .red:
            redLightView.layer.opacity = lightsOff
            yellowLightView.layer.opacity = lightsOn
            currentColor = .yellow
        case .yellow:
            yellowLightView.layer.opacity = lightsOff
            greenLightView.layer.opacity = lightsOn
            currentColor = .green
        case .green:
            greenLightView.layer.opacity = lightsOff
            redLightView.layer.opacity = lightsOn
            currentColor = .red
        }
    }
    
    @IBAction func resetButtonPressed() {
        redLightView.layer.opacity = lightsOff
        yellowLightView.layer.opacity = lightsOff
        greenLightView.layer.opacity = lightsOff
        
        startButtonOutlet.setTitle("Start", for: .normal)
    
        resetButtonOutlet.layer.backgroundColor = UIColor.systemGray.cgColor
        
        currentColor = .green
    }
    
}

