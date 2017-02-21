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
    
    
    var brain = CaculatorBarin()
    
    
    @IBAction func AppendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if UserIsInTheMiddleOfTypingNumber {
            Display.text = Display.text! + digit
        }
        else{
            Display.text = digit
            UserIsInTheMiddleOfTypingNumber = true
        }
        print("digit = \(digit)")
    }
    
    //Caculator engine code
    
    @IBAction func Operate(sender: UIButton) {
        if UserIsInTheMiddleOfTypingNumber{
            UserIsInTheMiddleOfTypingNumber = false
            
            if let result = brain.pushOpperand(opperand: DisplayValue){
                DisplayValue = result
            }
            else{
                DisplayValue = 0
            }
        }
       if let operation = sender.currentTitle{
        if let result = brain.performOperation(symbol: operation){
            DisplayValue = result
        }else{
            DisplayValue = 0
        }
        }
    }

    @IBAction func Enter() {
        UserIsInTheMiddleOfTypingNumber = false
        
        if let result = brain.pushOpperand(opperand: DisplayValue){
            DisplayValue = result
        }
        else{
            DisplayValue = 0
        }
        
//        opperandStack .append(DisplayValue)
//        print("opperandStack = \(opperandStack)")
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






