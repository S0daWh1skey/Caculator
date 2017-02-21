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
        
        
        var discription: String{
            get {
                switch self{
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol, _):
                    return symbol
                }
            }
        }
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
    
    private func evaluate(ops: [Op]) ->(result: Double?, remainingOps: [Op]){
        
        if !ops.isEmpty{
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let opperand):
                return(opperand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluate = evaluate(ops: remainingOps)     //recuresd
                if let opperand = operandEvaluate.result{
                    return(operation(opperand), operandEvaluate.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(ops: remainingOps)
                if let operand1 = op1Evaluation.result{
                let op2Evaluation = evaluate(ops: op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return(operation(operand1,operand2),op2Evaluation.remainingOps)
                    }
                }
               //default: break    //unused default
            }
        }
        
        return(nil, ops)
    
    }
    
    func evaluate() -> Double? {
        let(result, remainder) = evaluate(ops: opStack)
        
        print("\(opStack) - \(result) with \(remainder) left over")
        return result
        
    }
    
    private var opStack = [Op]()   //var opStack = Array<Op>()
    
    func pushOpperand(opperand: Double) -> Double?{
        opStack.append(Op.Operand(opperand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double? {
        if let operation = knowOps[symbol] {
        opStack.append(operation)
    }
        return evaluate()
    }
}
