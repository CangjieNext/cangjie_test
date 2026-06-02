/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a09_45

  @Level:         1

  @Assertion:    13.1.2.2(9)  As with the foreign functions, the parameters and
                 return types of other forms of CFunc must conform the CType
                 constraint, and named parameters and parameter default values
                 are not supported.

  @Description:  CFunc may use Int64 as parameter type.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C
func func_01(x: Int64) : Int64 {
    x
}

main() {
    var FPtr: CFunc<(Int64)->Int64> = func_01
    let X: Int64 = -9000000000000000000i64
    var Val = unsafe{ FPtr(X) }
    Assert.equals(-9000000000000000000i64, Val)
}