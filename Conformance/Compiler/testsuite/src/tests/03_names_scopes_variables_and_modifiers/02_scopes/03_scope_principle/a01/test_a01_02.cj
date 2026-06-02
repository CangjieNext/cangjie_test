/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_a01_02

  @Level:         1
  @Assertion:   3.2.3(1) Based on where the names are declared or defined,
                we distinguish three types of scopes: top-level, local-level, and type-internal.
  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

var y = 42
var x = y

open class X {
    var v = y
}

main() {
    Assert.equals(42, y, reason:"Variable 'y' doesn't initialized in global scope")
    Assert.equals(42, x, 
        reason: "Variable 'y' doesn't initialized in global scope so global variable 'x' also not initialized")
    var z = y
    Assert.equals(42, z, 
        reason: "Variable 'y' doesn't initialized in global scope so local variable 'x' also not initialized")
    var x1 = X()
    Assert.equals(42, x1.v, reason: 
        "Variable 'y' doesn't initialized in global scope so type-internal variable 'x1.v' also not initialized")
    return 0
}
