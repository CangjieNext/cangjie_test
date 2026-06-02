/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_27

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that composite expressions have type and value.
                Test try exceptions.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

main() {
    var sum = 0
  
    var unit = try {
        sum++
        throw Exception("1st level")
    } catch(_) {
        try {
            sum++
            throw Exception("2nd level")
        } catch(_) {
            try {
                sum++
                throw Exception("3rd level")
            } catch(_) {
                sum++       
            } finally {
                sum++
            }
        }
    }

    Assert.equals(5, sum)
    Assert.isTrue(unit is Unit) 
    if(() != unit) {
        Assert.fail(reason: "Unit should have value ()") 
    }
}
