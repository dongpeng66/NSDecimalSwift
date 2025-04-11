//
//  NNDecimalNumber.swift
//  NSDecimalSwift
//
//  Created by BJSTTLP185 on 2025/3/24.
//

import Foundation
import UIKit

protocol NNDecimalNumber {
    var nn_add: (Any?) -> String { get }
    var nn_sub: (Any?) -> String { get }
    var nn_mul: (Any?) -> String { get }
    var nn_div: (Any?) -> String { get }
    var nn_power: (Any?) -> String { get }
    var nn_mulPowerOf10: (Any?) -> String { get }
    
    var nn_add_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String { get }
    var nn_sub_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String { get }
    var nn_mul_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String { get }
    var nn_div_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String { get }
    var nn_power_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String { get }
    var nn_mulPowerOf10_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String { get }
    
    var nn_toString: () -> String { get }
    var nn_toString_behavior: (_ behavior: (any NSDecimalNumberBehaviors)?) -> String { get }
    
    var nn_toDefaultString: (Any?) -> String { get }
    
    
    var nn_toStringByDefault: (Any?) -> String { get }
    var nn_toStringByDefault_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String { get }
}

protocol NNDecimalNumberCompare {
    /// 以下方法基于 NSNumber compare: 实现
    func nn_decimalCompare(_ value: Any?) -> ComparisonResult
    func nn_decimalIsEqualTo(_ value: Any?) -> Bool
    func nn_decimalIsGreaterThan(_ value: Any?) -> Bool
    func nn_decimalIsGreaterThanOrEqualTo(_ value: Any) -> Bool
    func nn_decimalIsLessThan(_ value: Any?) -> Bool
    func nn_decimalIsLessThanOrEqualTo(_ value: Any?) -> Bool
}


extension String: NNDecimalNumber, NNDecimalNumberCompare {
    // MARK: - 直接转String同时给一个默认值,防止丢失精度,防止出现Nan
    var nn_toStringByDefault: (Any?) -> String {
        return { value in
            let currentString = nn_convertString(self)
            if !self.isEmpty, !NN_isNaN(currentString) {
                return self.nn_toString() as String
            }
            return nn_convertString(value) as String
        }
    }
    // MARK: - 直接转String同时给一个默认值,防止丢失精度,防止出现Nan,第二个参数是DecimalNumberDefaultBehavior
    var nn_toStringByDefault_behavior: (Any?, (any NSDecimalNumberBehaviors)?) -> String {
        return { value, behavior in
            let currentString = nn_convertString(self)
            if !self.isEmpty, !NN_isNaN(currentString) {
                return self.nn_toString_behavior(behavior) as String
            }
            return nn_convertString(value).nn_toString_behavior(behavior) as String
        }
    }
    
    // MARK: - 直接转String给一个默认值防止出现Nan
    var nn_toDefaultString: (Any?) -> String {
        return { value in
            let currentString = nn_convertString(self)
            if !self.isEmpty, !NN_isNaN(currentString) {
                return self as String
            }
            return nn_convertString(value) as String
        }
    }
    
    // MARK: - 直接转String防止丢失精度
    var nn_toString: () -> String {
        return {
            return nn_calculate(.add, self, "0") as String
        }
    }
    // MARK: - 直接转String防止丢失精度,第二个参数是DecimalNumberDefaultBehavior
    var nn_toString_behavior: ((any NSDecimalNumberBehaviors)?) -> String {
        return { behavior  in
            return nn_calculate_behavior(.add, self, "0", behavior) as String
        }
    }
    
    // MARK: - 数学运算,加,参数是string
    var nn_add: (Any?) -> String {
        return { value in
            return nn_calculate(.add, self, value) as String
        }
    }
    // MARK: - 数学运算,减,参数是string
    var nn_sub: (Any?) -> String {
        return { value in
            return nn_calculate(.sub, self, value) as String
        }
    }
    // MARK: - 数学运算,乘,参数是string
    var nn_mul: (Any?) -> String {
        return { value in
            return nn_calculate(.mul, self, value) as String
        }
    }
    // MARK: - 数学运算,除,参数是string
    var nn_div: (Any?) -> String {
        return { value in
            return nn_calculate(.div, self, value) as String
        }
    }
    // MARK: - 数学运算,幂等比如："3".nn_power("3")=3*3*3=27,参数是string
    var nn_power: (Any?) -> String {
        return { value in
            return nn_calculate(.power, self, value) as String
        }
    }
    // MARK: - 数学运算,乘以10的幂意味着将数字乘以10的一次方、二次方、三次方等。比如："5".nn_mulPowerOf10("4")=5*(10*10*10*10)=50000,参数是string
    var nn_mulPowerOf10: (Any?) -> String {
        return { value in
            return nn_calculate(.mulPowerOf10, self, value) as String
        }
    }
    // MARK: - 数学运算,加,可添加behavior,第一个参数是string,第二个参数是DecimalNumberDefaultBehavior
    var nn_add_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String {
        return { value,behavior  in
            return nn_calculate_behavior(.add, self, value, behavior) as String
        }
    }
    // MARK: - 数学运算,减,可添加behavior,第一个参数是string,第二个参数是DecimalNumberDefaultBehavior
    var nn_sub_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String {
        return { value, behavior in
            return nn_calculate_behavior(.sub, self, value, behavior) as String
        }
    }
    // MARK: - 数学运算,乘,可添加behavior,第一个参数是string,第二个参数是DecimalNumberDefaultBehavior
    var nn_mul_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String {
        return { value, behavior in
            return nn_calculate_behavior(.mul, self, value, behavior) as String
        }
    }
    // MARK: - 数学运算,除,可添加behavior,第一个参数是string,第二个参数是DecimalNumberDefaultBehavior
    var nn_div_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String {
        return { value, behavior in
            return nn_calculate_behavior(.div, self, value, behavior) as String
        }
    }
    // MARK: - 数学运算,幂等比如："3".nn_power_behavior("3",behavior)=3*3*3=27,可添加behavior,第一个参数是string,第二个参数是DecimalNumberDefaultBehavior
    var nn_power_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String {
        return { value, behavior in
            return nn_calculate_behavior(.power, self, value, behavior) as String
        }
    }
    // MARK: - 数学运算,乘以10的幂意味着将数字乘以10的一次方、二次方、三次方等。比如："5".nn_mulPowerOf10("4")=5*(10*10*10*10)=50000,可添加behavior,第一个参数是string,第二个参数是DecimalNumberDefaultBehavior
    var nn_mulPowerOf10_behavior: (Any?, _ behavior: (any NSDecimalNumberBehaviors)?) -> String {
        return { value, behavior in
            return nn_calculate_behavior(.mulPowerOf10, self, value, behavior) as String
        }
    }
    // MARK: - 比较运算
    func nn_decimalCompare(_ value: Any?) -> ComparisonResult {
        let l = nn_decimalNumberWithValue(self)
        let r = nn_decimalNumberWithValue(value)
        return l.compare(r)
    }
    // MARK: - 比较运算,等于
    func nn_decimalIsEqualTo(_ value: Any?) -> Bool {
        return nn_decimalCompare(value) == .orderedSame
    }
    // MARK: - 比较运算,大于
    func nn_decimalIsGreaterThan(_ value: Any?) -> Bool {
        return nn_decimalCompare(value) == .orderedDescending
    }
    // MARK: - 比较运算,小于
    func nn_decimalIsLessThan(_ value: Any?) -> Bool {
        return nn_decimalCompare(value) == .orderedAscending
    }
    // MARK: - 比较运算,大于等于
    func nn_decimalIsGreaterThanOrEqualTo(_ value: Any) -> Bool {
        let result = nn_decimalCompare(value)
        return result == .orderedDescending || result == .orderedSame
    }
    // MARK: - 比较运算,小于等于
    func nn_decimalIsLessThanOrEqualTo(_ value: Any?) -> Bool {
        let result = nn_decimalCompare(value)
        return result == .orderedAscending || result == .orderedSame
    }

    
}
/// NaN 值判断
/// - Parameter value: 运算值
func NN_isNaN(_ value: Any?) -> Bool {
    if value == nil {
        return true
    }
    
    if let stringValue = value as? String {
        let d = NSDecimalNumber(string: stringValue)
        return NSDecimalNumber.notANumber.isEqual(to: d)
    }
    
    if let numberValue = value as? NSNumber {
        return NSDecimalNumber.notANumber.isEqual(to: numberValue)
    }
    
    return true
}
