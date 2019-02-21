//
//  ViewController.swift
//  Calculator
//
//  Created by Craig Mathieson on 2018-06-11.
//  Copyright © 2018 Craig Mathieson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var OutputLabel: UILabel!
    var input1: String = ""
    var input2: String = ""
    var inputNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        OutputLabel.text = "0"
        input1 = ""
        input2 = ""
        inputNumber = 0
    }
    
    @IBAction func functionPressed(_ sender: UIButton) {
        
        let functionKey = (sender.titleLabel?.text)!
        
        switch functionKey {
        case "/":
            inputNumber = 1
        case "X":
            inputNumber = 2
        case "-":
            inputNumber = 3
        case "+":
            inputNumber = 4
        default:
            inputNumber = 0
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if inputNumber == 0 {
            input1 += (sender.titleLabel?.text)!
            OutputLabel.text = input1
        } else {
            input2 += (sender.titleLabel?.text)!
            OutputLabel.text = input2
        }
    }
    
    @IBAction func zeroPressed(_ sender: UIButton) {
        if inputNumber == 0 {
            if input1 != "" {
                input1 += "0"
            }
            OutputLabel.text = input1
        } else {
            if input2 != "" {
                input2 += "0"
            }
            OutputLabel.text = input2
        }
    }
    
    @IBAction func equalsPressed(_ sender: Any) {
        if input1 == "" || input2 == "" {
            return
        }
        
        let firstArg = Int(input1)
        let secondArg = Int(input2)
        
        switch inputNumber {
        case 1:
            input1 = String(firstArg!/secondArg!)
        case 2:
            input1 = String(firstArg!*secondArg!)
        case 3:
            input1 = String(firstArg! - secondArg!)
        case 4:
            input1 = String(firstArg! + secondArg!)
        default:
            input1 = "0"
        }
        
        inputNumber = 0
        OutputLabel.text = input1
        input2 = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

