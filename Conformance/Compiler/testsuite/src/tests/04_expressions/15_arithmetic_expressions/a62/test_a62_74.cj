
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a62_74

  @Level:         1

  @Assertion:   4.15(62) Arithmetic operators introduced above are safe in the Cangjie programming language. That is,
                if an overflow (i.e., the value of an expression is beyond the range of its type) is detected at
                compile time, then a compilation error will be reported; otherwise an ArithmeticException is thrown
                at runtime.
  @Description: Checks that ** operator calculation for integers causes an ArithmeticException.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

func f(a: Int64, b: UInt64) {
    a ** b
}

main() {
    var caught : Bool = false
    try {
        f(-2, 64u64)
    } catch (e: ArithmeticException) {
        caught = true
    }
    Assert.isTrue(caught)
}
