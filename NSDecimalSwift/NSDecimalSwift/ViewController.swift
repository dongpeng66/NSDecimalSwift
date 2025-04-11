//
//  ViewController.swift
//  NSDecimalSwift
//
//  Created by BJSTTLP185 on 2025/3/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let numTen = NNDecimalNumberDefaultBehavior()
        numTen.roundingModeItem = .plain
        numTen.scaleNum = 8

        let v1 = "3.23".nn_sub("2")
            .nn_add("5")
            .nn_mul("3")
            .nn_mul("4.22")
            .nn_div("3.3")
        print("v1 = \(v1)")

        // MARK: ：数值比较

        let v2 = "100"
        let v3 = "100.2"

        if v2.nn_decimalIsEqualTo(v3) {
            print("v2 == v3 : v2 = \(v2), v3 = \(v3)")
        } else if v2.nn_decimalIsGreaterThan(v3) {
            print("v2 > v3 : v2 = \(v2), v3 = \(v3)")
        } else if v2.nn_decimalIsLessThan(v3) {
            print("v2 < v3 : v2 = \(v2), v3 = \(v3)")
        } else if v2.nn_decimalIsGreaterThanOrEqualTo(v3) {
            print("v2 >= v3 : v2 = \(v2), v3 = \(v3)")
        } else if v2.nn_decimalIsLessThanOrEqualTo(v3) {
            print("v2 <= v3 : v2 = \(v2), v3 = \(v3)")
        }

        let v4 = "3.2".nn_sub("3.2")
            .nn_add("5.0")
            .nn_mul("4.22")
            .nn_mul("49")
            .nn_div("3.3")
        print("v4 = \(v4)")
        
        let v5 = "3.3".nn_add("5.0")
            .nn_div("3.3")
            .nn_add("5.0")
            .nn_mul("4.22")
            .nn_add("49")
            .nn_mul("4.22")
            .nn_add("49")
            .nn_add("49")
            .nn_mul("4.22")
        print("v5 = \(v5)")
        
        let v7 = "3".nn_add("2")
            .nn_add("5")
            .nn_mul("3")
            .nn_mul("10".nn_mul("2"))
            .nn_div("2")
        print("v7 = \(v7)")
        
        let v8 = "3".nn_add("2")
            .nn_add("5")
            .nn_mul("3")
            .nn_mul("10".nn_mul("2"))
            .nn_div("2")
        print("v8 = \(v8)")
        
        let v9 = "3".nn_add("2")
            .nn_mul("3.882")
            .nn_mul("10".nn_mul("2.11"))
            .nn_div("3.33")
        print("v9 = \(v9)")
        
        let v10 = "3".nn_add_behavior("2", numTen)
            .nn_mul_behavior("3.882", numTen)
            .nn_mul_behavior("10".nn_mul_behavior("2.11", numTen),numTen)
            .nn_div_behavior("3.33", numTen)
        print("v10 = \(v10)")
        
        let v11 = "3".nn_power("3")
        print("v11 = \(v11)")
        
        let v12 = "5".nn_mulPowerOf10("4")
        print("v12 = \(v12)")
        
        let v13 = "4.991".nn_toString()
        print("v13 = \(v13)")
        
        let v131 = "4.9999".nn_toString()
        print("v131 = \(v131)")
        
        let v14 = "4.9999999".nn_toString_behavior(numTen)
        print("v14 = \(v14)")
        
        let v15 = "4.999999999".nn_toString()
            .nn_add("1.3333333333")
            .nn_add_behavior("1.2222222222222222222222 ", numTen)
        print("v15 = \(v15)")
        
        let v16 = "".nn_toString()
            .nn_add("1.3333333333")
        if NN_isNaN(v16) {
            print("v16 ==== NaN")
        } else {
            print("v16 = \(v16)")
        }
        
        let v17 = "Nd".nn_toDefaultString("0").nn_toString()
            .nn_add("1.3333333333")
        if NN_isNaN(v17) {
            print("v17 ==== NaN")
        } else {
            print("v17 = \(v17)")
        }
        
        let v18 = "Nd".nn_toStringByDefault("0")
            .nn_add("1.3333333333")
        if NN_isNaN(v18) {
            print("v18 ==== NaN")
        } else {
            print("v18 = \(v18)")
        }
        
        let v19 = "Nd".nn_toStringByDefault("0")
            .nn_add("1.3333333333")
        if NN_isNaN(v19) {
            print("v19 ==== NaN")
        } else {
            print("v19 = \(v19)")
        }
        
        var v20 = "Nd".nn_toStringByDefault_behavior("0.11111111111", numTen)
        
        if NN_isNaN(v20) {
            print("v20 ==== NaN")
        } else {
            print("v20 = \(v20)")
        }
        v20 = v20.nn_add("1.3333333333")
        if NN_isNaN(v20) {
            print("v20 ==== NaN")
        } else {
            print("v20 = \(v20)")
        }
    }


}
