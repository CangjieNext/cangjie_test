/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_a01_08

  @Level:         1
  @Assertion:   3.2.3(1) Based on where the names are declared or defined,
                we distinguish three types of scopes: top-level, local-level, and type-internal.
  @Mode:        run
  @Negative:    no
  @Structure:   single

*/

import utils.assert.Assert

main() {
    var y = 451
    var x = y
    Assert.equals(451, y, reason:"Variable 'y' doesn't initialized in local scope")
    Assert.equals(451, x, 
        reason: "Variable 'y' doesn't initialized in local scope so local variable 'x' also not initialized")

    let a = 911
    let b = a
    Assert.equals(911, a, reason:"Constant 'a' doesn't initialized in local scope")
    Assert.equals(911, b, 
        reason: "Constant 'a' doesn't initialized in local scope so local constant 'a' also not initialized")

    let c = y
    var d = a
    Assert.equals(451, c, 
        reason: "Variable 'y' doesn't initialized in local scope so local constant 'c' also not initialized")
    Assert.equals(911, d, 
        reason: "Constant 'a' doesn't initialized in local scope so local variable 'd' also not initialized")
    return 0
}
