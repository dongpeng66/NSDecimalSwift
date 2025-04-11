//
//  NNDecimalNumberDefaultBehavior.swift
//  NSDecimalSwift
//
//  Created by BJSTTLP185 on 2025/3/24.
//

import Foundation

class NNDecimalNumberDefaultBehavior: NSObject, NSDecimalNumberBehaviors {
    // MARK: - NSDecimalNumberBehaviors Protocol
    //默认是四舍五入
    var roundingModeItem:RoundingMode = .plain
    //默认保留2位小数
    var scaleNum:Int16 = 2
    
    func roundingMode() -> NSDecimalNumber.RoundingMode {
        return NSDecimalNumber.RoundingMode(rawValue: roundingModeItem.rawValue) ?? .plain
    }
    /**
     
     
     iOS NSDecimalNoScale 计算出现nan
     在iOS开发中，使用NSDecimalNumber进行小数计算时，可能会遇到NSDecimalNoScale导致结果为nan（非数）的情况。NSDecimalNoScale是一个常量，用于表示没有小数部分的数值，其值通常是128。当你试图将一个有特定小数位数的数值与NSDecimalNoScale一起使用，而没有适当地处理小数点，就可能遇到nan问题。
     原因
     当你使用NSDecimalNumber进行计算时，涉及到小数位数的转换或比较时，如果不正确处理小数点，很容易出现nan。例如，如果你尝试将一个有小数点的数字与设置为无小数点的NSDecimalNumber进行运算，而没有先调整它们的小数位数，就可能导致错误。
     解决方法
     确保所有参与计算的NSDecimalNumber都有相同的小数位数：
     使用NSDecimalNumberHandler来控制小数点位数。例如，如果你希望所有的计算都保留两位小数，你可以这样设置：
     */
    func scale() -> Int16 {
        return scaleNum
    }
    
    func exceptionDuringOperation(_ operation: Selector,
                                error: NSDecimalNumber.CalculationError,
                                leftOperand: NSDecimalNumber,
                                rightOperand: NSDecimalNumber?) -> NSDecimalNumber? {
        return NSDecimalNumber.notANumber
    }
}
extension NNDecimalNumberDefaultBehavior {

    /***************    Type definitions        ***********/
    public enum RoundingMode : UInt, @unchecked Sendable {

        case plain = 0

        case down = 1

        case up = 2

        case bankers = 3
    }
}
