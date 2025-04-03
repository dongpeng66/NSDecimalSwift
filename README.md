# NSDecimalSwift

## 介绍

提供 String NSDecimalNumber 运算扩展 ，通过链式调用简化数值计算。

## 使用

- 示例一：

```
    //( ( ( ( 3.23 - 2 + 5 ) × 3 ) × 4.22 ) ÷ 3.3 )
        let v1 = "3.23".nn_sub("2")
            .nn_add("5")
            .nn_mul("3")
            .nn_mul("4.22")
            .nn_div("3.3")
        print("v1 = \(v1)")
```

- 示例二：数值比较

```
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
```

- 示例三：不使用默认NSDecimalNumberBehaviors，使用自定义NSDecimalNumberBehaviors

```
    //( ( ( ( 3 + 2 ) × 3.882 ) × ( 10 × 2.11 ) ) ÷ 3.33 )
        let v10 = "3".nn_add_behavior("2", NNDecimalNumberDefaultBehavior2())
            .nn_mul_behavior("3.882", NNDecimalNumberDefaultBehavior2())
            .nn_mul_behavior("10".nn_mul_behavior("2.11", NNDecimalNumberDefaultBehavior2()), NNDecimalNumberDefaultBehavior2())
            .nn_div_behavior("3.33", NNDecimalNumberDefaultBehavior2())
        print("v10 = \(v10)")
```

- 示例四：幂运算

```
    {
        //( 3 ^ 3 )
        let v11 = "3".nn_power("3")
        print("v11 = \(v11)")
    }
    {
        //( 5 ) × 10 ^ 4 )
        let v12 = "5".nn_mulPowerOf10("4")
        print("v12 = \(v12)")
    }
```

- 示例五：直接转String防止丢失精度

```
        let v13 = "4.991".nn_toString()
        print("v13 = \(v13)")
        
        let v14 = "4.9999999".nn_toString_behavior(NNDecimalNumberDefaultBehavior2())
        print("v14 = \(v14)")
        
        let v15 = "4.999999999".nn_toString()
            .nn_add("1.3333333333")
            .nn_add_behavior("1.2222222222222222222222 ", NNDecimalNumberDefaultBehavior2())
        print("v15 = \(v15)")
        
        let v16 = "".nn_toString()
            .nn_add("1.3333333333")
        if NN_isNaN(v16) {
            print("v16 ==== NaN")
        } else {
            print("v16 = \(v16)")
        }

```

- 示例六：直接转String给一个默认值防止出现Nan

```
        let v17 = "Nd".nn_toDefaultString("0").nn_toString()
            .nn_add("1.3333333333")
        if NN_isNaN(v17) {
            print("v17 ==== NaN")
        } else {
            print("v17 = \(v17)")
        }
```

- 示例六：直接转String同时给一个默认值,防止丢失精度,防止出现Nan

```
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
        
        var v20 = "Nd".nn_toStringByDefault_behavior("0.11111111111", NNDecimalNumberDefaultBehavior2())
        
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
```

