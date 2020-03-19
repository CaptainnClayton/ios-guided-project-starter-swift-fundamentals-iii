//
//  ViewController.swift
//  TurkeyCalculator
//
//  Created by Paul Solt on 6/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet var turkeyWeightTextField: UITextField!
    @IBOutlet var cookTimeTextField: UITextField!
    @IBOutlet var metricButton: UIButton!
    
    // Actions
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        // Get the input from the user in turkeyWeightTexField
        guard let turkeyWeightString = turkeyWeightTextField.text else {return}
        
        guard let turkeyWeight = Double(turkeyWeightString) else{
            print("Invalid Number")
            return
        }
        
        //Calculate cook time based on turky weight and metric system used
        var durationInMinutes: Double
        
        if metricButton.isSelected {
            durationInMinutes = cookTimeInKg(turkeyWeight)
        } else {
            durationInMinutes = cookTimeInPounds(turkeyWeight)
        }
        
        //Present the cook time to the user in the cookTimeTextField
        let durationInHours = durationInMinutes / 60
        cookTimeTextField.text = "\(durationInHours) hours"
    }
    
    @IBAction func metricButtonPressed(_ sender: Any) {
        //Conditional downcast
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
    }
    
    // Helper functions
    
    func cookTimeInPounds(_ weight: Double) -> Double{
        let durationInMinutes = weight * 15.0
        return durationInMinutes
    }
    
    func cookTimeInKg(_ weight: Double) -> Double{
        var durationInMinutes: Double
        
        if weight >= 4{
            durationInMinutes = 20 * weight + 90
        } else {
            durationInMinutes = 20 * weight + 70
        }
        
        return durationInMinutes
    }
}
