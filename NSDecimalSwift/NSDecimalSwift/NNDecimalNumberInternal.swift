//
//  NNDecimalNumberInternal.swift
//  NSDecimalSwift
//
//  Created by BJSTTLP185 on 2025/3/24.
//

import Foundation

// MARK: - Helper Functions

/// 将值转换为 NSDecimalNumber
/// - Parameter value: 数字字符串或 NSNumber
/// - Returns: NSDecimalNumber
func nn_decimalNumberWithValue(_ value: Any?) -> NSDecimalNumber {
    if let stringValue = value as? String {
        return NSDecimalNumber(string: stringValue)
    }
    if let numberValue = value as? NSNumber {
        return NSDecimalNumber(decimal: numberValue.decimalValue)
    }
    return NSDecimalNumber.notANumber
}

/// 解析运算栈
/// - Parameter formulaStack: 运算公式栈
/// - Returns: 运算公式字符串
func nn_formulaFromFormulaStack(_ formulaStack: [Any]?) -> String {
    var formula = "( "
    if let stack = formulaStack {
        for f in stack {
            if let stringValue = f as? String {
                formula += "\(stringValue) "
            } else {
                formula += "\(nn_formulaFromFormulaStack(f as? [Any])) "
            }
        }
    }
    formula += ")"
    return formula
}

func nn_convertString(_ value: Any?) -> String {
    if value == nil {
        return NSDecimalNumber.notANumber.stringValue
    }
    if let stringValue = value as? String {
        let mValue = stringValue
        return mValue
    }
    if let numberValue = value as? NSNumber {
        return numberValue.stringValue
    }
    return String(describing: value)
}

// MARK: - Operator Type Enum

enum NNDecimalNumberOperatorType: UInt {
    case add
    case sub
    case mul
    case div
    case power
    case mulPowerOf10
}

/// 运算函数
/// - Parameters:
///   - operatorType: 运算类型
///   - l: 运算符左侧运算值
///   - r: 运算符右侧运算值
/// - Returns: 计算结果字符串
func nn_calculate(_ operatorType: NNDecimalNumberOperatorType, _ l: Any?, _ r: Any?) -> String {
    let ls = nn_convertString(l)
    let rs = nn_convertString(r)
    
    let ld = NSDecimalNumber(string: ls as String)
    let rd = NSDecimalNumber(string: rs as String)
    var xd = NSDecimalNumber.notANumber
    

    
    let behavior: NSDecimalNumberBehaviors = {
        return NNDecimalNumberDefaultBehavior()
    }()
    
    switch operatorType {
    case .add:
        
        xd = ld.adding(rd, withBehavior: behavior)
    case .sub:
        
        xd = ld.subtracting(rd, withBehavior: behavior)
    case .mul:
        
        xd = ld.multiplying(by: rd, withBehavior: behavior)
    case .div:
        xd = ld.dividing(by: rd, withBehavior: behavior)
    case .power:

        xd = ld.raising(toPower: Int(rd.uintValue), withBehavior: behavior)
    case .mulPowerOf10:

        xd = ld.multiplying(byPowerOf10: Int16(rd.intValue), withBehavior: behavior)
    }
    
    let xs = xd.stringValue
    
    return xs
}
func nn_calculate_behavior(_ operatorType: NNDecimalNumberOperatorType, _ l: Any?, _ r: Any?, _ behavior: Any?) -> String {
    let ls = nn_convertString(l)
    let rs = nn_convertString(r)
    
    let ld = NSDecimalNumber(string: ls as String)
    let rd = NSDecimalNumber(string: rs as String)
    var xd = NSDecimalNumber.notANumber
    

    
    let behavior: NSDecimalNumberBehaviors = {
        if let behaviors = behavior as? NSDecimalNumberBehaviors {
            return behaviors
        }
        return NNDecimalNumberDefaultBehavior()
    }()
    
    switch operatorType {
    case .add:
        
        xd = ld.adding(rd, withBehavior: behavior)
    case .sub:
        
        xd = ld.subtracting(rd, withBehavior: behavior)
    case .mul:
        
        xd = ld.multiplying(by: rd, withBehavior: behavior)
    case .div:
        xd = ld.dividing(by: rd, withBehavior: behavior)
    case .power:

        xd = ld.raising(toPower: Int(rd.uintValue), withBehavior: behavior)
    case .mulPowerOf10:

        xd = ld.multiplying(byPowerOf10: Int16(rd.intValue), withBehavior: behavior)
    }
    
    let xs = xd.stringValue
    
    return xs
}
