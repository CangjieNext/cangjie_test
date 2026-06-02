/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:     13_01_03_04_a01_01

  @Level:         1

  @Assertion:   13.1.3.4(1) Cangjie uses the VArray type to map with C array type.

  @Description:  Use VArray to pass array parameter to C function.

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006077

*/

import utils.assert.Assert

foreign func func_01(a: VArray<Int32, $5>): Int64

main() {
    var arr: VArray<Int32, $5> = [1,2,3,4,5]
    let Val = unsafe{ func_01(inout arr) }
    Assert.equals(15, Val)
}
