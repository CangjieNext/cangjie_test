/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a04_01

  @Level:         1

  @Assertion: 4.2(4) Examples of variable names and function names:

    let intNum: Int64 = 100 // 'intNum' is the name of a variable, whose value 
                            // and type are '100' and 'Int64', respectively.

    /* 'add' is the name of a function, whose value and type are 
       '(p1: Int64, p2: Int64) => {p1 + p2}' and '(Int64, Int64) -> Int64', respectively. 
    */
    func add(p1: Int64, p2: Int64) { 
        p1 + p2
    }

    let value = p1.x // x is a variable defined in package p1.

  @Description: Checks example from the Spec. 
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a04.cj  
*/

import p1

import utils.assert.Assert

main() {
    let intNum: Int64 = 100 // 'intNum' is the name of a variable, whose value
                            // and type are '100' and 'Int64', respectively.
    Assert.isTrue(intNum is Int64)
    Assert.equals(100, intNum)

    /* 'add' is the name of a function, whose value and type are 
       '(p1: Int64, p2: Int64) => {p1 + p2}' and '(Int64, Int64) -> Int64', respectively. 
    */
    func add(p1: Int64, p2: Int64) { 
        p1 + p2
    }
    Assert.isTrue(add is (Int64, Int64) -> Int64)
    // Seems like there is no way to compare two closures, so all that can be
    // done here is to assign 'add' value to the variable of the corresponding 
    // closure type and check the function execution result.
    var f: (Int64, Int64) -> Int64 = add
    Assert.equals(5, f(2, 3))

    let value = p1.x // x is a variable defined in package p1.
    Assert.isTrue(value is Int64)
    Assert.equals(123456, value)

    return
}

