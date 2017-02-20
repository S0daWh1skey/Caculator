//
//  ViewController.swift
//  Caculator
//
//  Created by Albert Sphepherd on 2017/2/20.
//  Copyright © 2017年 Albert Sphepherd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   /* override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
 
    }  */

    @IBOutlet weak var Display: UILabel!

    var UserIsInTheMiddleOfTypingNumber: Bool = false
    
    @IBAction func AppendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if UserIsInTheMiddleOfTypingNumber{
        Display.text = Display.text! + digit
        }
        else{
            Display.text = digit
            UserIsInTheMiddleOfTypingNumber = true
        }
        print("digit = \(digit)")
    }
    
    @IBAction func Operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if UserIsInTheMiddleOfTypingNumber{
            Enter()
        }
        switch operation{
            case "×":
                PerformOperation(operation: {$0 * $1})
            case "÷":
                PerformOperation(operation: {$1 * $0})
            case "+":
                PerformOperation(operation: {$0 * $1})
            case "-":
                PerformOperation(operation: {$1 * $0})
       default: break
        }
    }

    func PerformOperation(operation: (Double, Double) -> Double){
        if(opperandStack.count >= 2){
            DisplayValue = operation(opperandStack.removeLast() , opperandStack.removeLast())
            Enter()
        }
    }
    
    var opperandStack = Array<Double>()
    
    @IBAction func Enter() {
        UserIsInTheMiddleOfTypingNumber = false
        opperandStack .append(DisplayValue)
        print("opperandStack = \(opperandStack)")
    }
    var DisplayValue: Double {
        get{
            return NumberFormatter().number(from: Display.text!) as! Double
        }
        set{
             Display.text = "\(newValue)"
            UserIsInTheMiddleOfTypingNumber = false
        }
    }
}






