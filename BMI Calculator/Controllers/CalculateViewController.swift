//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    
    var weight: Float = 100
    var height: Float = 1.65
    
    var bmiCalculator = BmiCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 1.65
        weightSlider.value = 100.0
        // Do any additional setup after loading the view.
    }

    @IBAction func onSliderChange(_ sender: UISlider) {
        
        if sender.tag == 1 {
            weight = sender.value
            lblWeight.text = String(Int(weight)) + "kg"
        } else {
            height = sender.value
            lblHeight.text =
            String(format: "%.2fm", height)
        }
    }
    
    @IBAction func btnOnPressed(_ sender: UIButton) {
        
        bmiCalculator.calculate(w: weight, h: height)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("aavfdv")
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiCalculator.getBmiValue()
            destinationVC.bmiColor = bmiCalculator.getColor()
            destinationVC.bmiAdvice = bmiCalculator.getAdvice()
        } 
    }
}


  
