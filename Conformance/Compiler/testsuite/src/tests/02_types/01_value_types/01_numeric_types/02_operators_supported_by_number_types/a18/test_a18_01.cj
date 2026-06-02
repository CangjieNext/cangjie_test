/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a18_01

  @Level:         1
  @Assertion:       2.1.1.2(18) The following are simple examples of (compound) assignment operation on integers.
                        main() {
                            var x: Int32 = 5
                            var y: Int32 = 10
                            x = y // assignment: x = 10
                            x += y // compound assignment: x = 20
                            x -= y // x = 10
                            x *= y // x = 100
                            x /= y // x = 10
                            x %= y // x = 0
                            x = 5 // x = 5
                            x **= 2 // x = 25
                            x <<= 1 // x = 50
                            x >>= 2 // x = 12
                            x &= y // x = 8
                            x ^= y // x = 2
                            x |= y // x = 10
                            return 0
                        }

  @Description:     Check that the Spec example works.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006177
*/

import utils.assert.Assert

main() {
    var x: Int32 = 5
    var y: Int32 = 10
    x = y // assignment: x = 10
    Assert.equals(10, x)
    x += y // compound assignment: x = 20
    Assert.equals(20, x)
    x -= y // x = 10
    Assert.equals(10, x)
    x *= y // x = 100
    Assert.equals(100, x)
    x /= y // x = 10
    Assert.equals(10, x)
    x %= y // x = 0
    Assert.equals(0, x)
    x = 5 // x = 5
    Assert.equals(5, x)
    var z : Int64 = 5
    z **= 2 // x = 25
    Assert.equals(25, z)
    x <<= 1 // x = 50
    Assert.equals(10, x)
    x >>= 2 // x = 12
    Assert.equals(2, x)
    x &= y // x = 8
    Assert.equals(2, x)
    x ^= y // x = 2
    Assert.equals(8, x)
    x |= y // x = 10
    Assert.equals(10, x)
    Assert.equals(10, y)
    return 0
}
