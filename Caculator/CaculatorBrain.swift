//
//  CaculatorBrain.swift
//  Caculator
//
//  Created by Albert Sphepherd on 2017/2/21.
//  Copyright © 2017年 Albert Sphepherd. All rights reserved.
//

import Foundation

class CaculatorBarin {
    
    private enum Op{
        case Operand(Double)
        case UnaryOperation(String, (Double) -> Double)
        case BinaryOperation(String, (Double,Double) -> Double)
        
    }
    private var knowOps = [String: Op]() //var knowOps = Dictionary<String, Op>()
    
    init() {
        knowOps["×"] = Op.BinaryOperation("×", *)
        knowOps["÷"] = Op.BinaryOperation("÷") { $1 / $0 }
        knowOps["+"] = Op.BinaryOperation("+", +)
        knowOps["-"] = Op.BinaryOperation("-") { $1 - $0 }
        knowOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
//    let brain = CaculatorBarin()
    
    private var opStack = [Op]()   //var opStack = Array<Op>()
    
    func pushOpperand(opperand: Double){
        opStack.append(Op.Operand(opperand))
        
    }
    
    func performOperation(symbol: String) {
        if let operation = knowOps[symbol] {
        opStack.append(operation)
    }
        
        
        
    }
}
