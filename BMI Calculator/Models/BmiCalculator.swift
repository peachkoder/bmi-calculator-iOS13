//
//  BmiCalculator.swift
//  BMI Calculator
//
//  Created by doc on 22/11/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct BmiCalculator {
    
    var bmiValue: Float?
    var bmi: BMI?
    
    mutating func calculate(w: Float, h: Float) {
        var bmiValue =   w / (h * h)
        switch bmiValue {
        case ..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat some snacks", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
            break
        case 18.5..<24.9:
            bmi = BMI(value: bmiValue, advice: "Great, you'r fine!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
            break
        default:
            bmi = BMI(value: bmiValue, advice: "You need to loose some weight", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
    }
    
    func getBmiValue() -> String {
        return  String(format: "%.2f", bmi?.value ?? 0.0)
        
    }
    
    func getAdvice() -> String {
        return  bmi?.advice ?? "Advice is not ready."
        
    }
    
    func getColor() -> UIColor {
        return  bmi?.color ?? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
}
