//
//  NNDecimalNumberDefaultBehavior2.swift
//  NSDecimalSwift
//
//  Created by BJSTTLP185 on 2025/4/2.
//
import Foundation

class NNDecimalNumberDefaultBehavior2: NSObject, NSDecimalNumberBehaviors {
    // MARK: - NSDecimalNumberBehaviors Protocol
    
    func roundingMode() -> NSDecimalNumber.RoundingMode {
        return .plain
    }
    
    func scale() -> Int16 {
        return 10
    }
    
    func exceptionDuringOperation(_ operation: Selector,
                                error: NSDecimalNumber.CalculationError,
                                leftOperand: NSDecimalNumber,
                                rightOperand: NSDecimalNumber?) -> NSDecimalNumber? {
        return NSDecimalNumber.notANumber
    }
}
