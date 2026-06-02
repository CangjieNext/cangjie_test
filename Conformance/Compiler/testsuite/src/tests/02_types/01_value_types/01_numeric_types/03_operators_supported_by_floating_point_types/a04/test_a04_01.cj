/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_03_a04_01

  @Level:         1
  @Assertion:       2.1.1.3(4)
                        let x = NaN
                        var y = 3.14
                        var z = x < y // z = false
                        var v = x != x // v = true
                        var w = (x < y) == !(x >= y) // w = false

  @Description:     Check that given example works.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006075

*/

import utils.assert.Assert

main() {
    let x = Float64.NaN
    var y = 3.14
    var z = x < y // z = false
    var v = x != x // v = true
    var w = (x < y) == !(x >= y) // w = false

    Assert.isFalse(z)
    Assert.isTrue(v)
    Assert.isFalse(w)
}
