//
//  ViewController.swift
//  GameOfLife
//
//  Created by Jaiprakash Yadav on 20/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var worldView: WorldView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    func setupUI() {
        let size = 10
        sizeLabel.text = "\(size * size)"
        
        slider.value = Float(size)
        slider.isContinuous = true
        slider.minimumValue = 5
        slider.maximumValue = 30
    }
    
    @IBAction func sizeChanged(sender: UISlider) {
        let sizeValue = Int(slider.value)
        sizeLabel.text = "\(sizeValue * sizeValue)"
    }
    
    @IBAction func startSimulation(sender: UIButton) {
        worldView.dimension = Int(slider.value)
        worldView.startSimulation()
    }
    
    @IBAction func stopSimulation(sender: UIButton) {
        worldView.stopSimulation()
    }
}



