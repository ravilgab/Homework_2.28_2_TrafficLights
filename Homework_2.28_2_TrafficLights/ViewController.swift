//
//  ViewController.swift
//  Homework_2.28_2_TrafficLights
//
//  Created by Ravil on 15.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    private var currentColor: CurrentLight = .green
    
    private let lightsOn: CGFloat = 1
    private let lightsOff: CGFloat = 0.2
    private let buttonCornerRadius: CGFloat = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.alpha = lightsOff
        yellowLightView.alpha = lightsOff
        greenLightView.alpha = lightsOff
        
        startButtonOutlet.layer.cornerRadius = buttonCornerRadius
        resetButtonOutlet.layer.cornerRadius = buttonCornerRadius
        
        resetButtonOutlet.layer.backgroundColor = UIColor.systemGray.cgColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.layer.bounds.width / 2
        greenLightView.layer.cornerRadius = greenLightView.layer.bounds.width / 2
    }

    @IBAction func startButtonPressed() {
        startButtonOutlet.setTitle("Next", for: .normal)
        
        resetButtonOutlet.layer.backgroundColor = #colorLiteral(red: 0, green: 0.300072529, blue: 0.6560639881, alpha: 1)
        
        switch currentColor {
        case .red:
            redLightView.alpha = lightsOff
            yellowLightView.alpha = lightsOn
            currentColor = .yellow
        case .yellow:
            yellowLightView.alpha = lightsOff
            greenLightView.alpha = lightsOn
            currentColor = .green
        case .green:
            greenLightView.alpha = lightsOff
            redLightView.alpha = lightsOn
            currentColor = .red
        }
    }
    
    @IBAction func resetButtonPressed() {
        redLightView.alpha = lightsOff
        yellowLightView.alpha = lightsOff
        greenLightView.alpha = lightsOff
        
        startButtonOutlet.setTitle("Start", for: .normal)
    
        resetButtonOutlet.layer.backgroundColor = UIColor.systemGray.cgColor
        
        currentColor = .green
    }
}

extension ViewController {
    enum CurrentLight {
        case red
        case yellow
        case green
    }
}

