
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_01_a02_05

  @Level:         1

  @Assertion: 4.1(2) For collective literals and tuple literals (see Value
              Types), whose value is the value of the literal obtained by 
              evaluating all expressions within it, and whose type is 
              determined by its syntax.
  @Description: Checks value and type of the array literals.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var a1 = [0, 1, 2, 3, 4, 5] 
    Assert.isTrue(a1 is Array<Int64>)
    if( [Assert.getRuntimeZero(), 1, 2, 3, 4, 5] != a1) {
        Assert.fail(reason: "Should be equal.")
    }
    Assert.isFalse(a1 is Array<Int8>)
    Assert.isFalse(a1 is Array<Int16>)
    Assert.isFalse(a1 is Array<Int32>)
    Assert.isFalse(a1 is Array<UInt8>)
    Assert.isFalse(a1 is Array<UInt16>)
    Assert.isFalse(a1 is Array<UInt32>)
    Assert.isFalse(a1 is Array<UInt64>)

    var a2 = ["Hello", "World"]
    Assert.isTrue(a2 is Array<String>)
    if( ["Hello", "World"] != a2) {
        Assert.fail(reason: "Should be equal.")
    }

    var a3: Array<Int32> = []
    Assert.isTrue(a3 is Array<Int32>)
    if( Array<Int32>() != a3) {
        Assert.fail(reason: "Should be equal.")
    }
}
