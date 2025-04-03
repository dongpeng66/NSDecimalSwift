//
//  NNDecimalNumberDefaultBehavior.swift
//  NSDecimalSwift
//
//  Created by BJSTTLP185 on 2025/3/24.
//

import Foundation

class NNDecimalNumberDefaultBehavior: NSObject, NSDecimalNumberBehaviors {
    // MARK: - NSDecimalNumberBehaviors Protocol
    
    func roundingMode() -> NSDecimalNumber.RoundingMode {
        return .plain
    }
    
    func scale() -> Int16 {
        return 2
    }
    
    func exceptionDuringOperation(_ operation: Selector,
                                error: NSDecimalNumber.CalculationError,
                                leftOperand: NSDecimalNumber,
                                rightOperand: NSDecimalNumber?) -> NSDecimalNumber? {
        return NSDecimalNumber.notANumber
    }
}
