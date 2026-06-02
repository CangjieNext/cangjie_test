/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a16_01

  @Level:         1
  @Assertion:       2.1.1.2(16) The following are examples of unary minus operator applied to integers
                        var i: Int32 = 5
                        var j: Int64 = 100
                        var k: Int32 = -i // k = -5
                        var l: Int64 = -j // l = -100

  @Description:     Check that the Spec example works.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    var i: Int32 = 5
    var j: Int64 = 100
    var k: Int32 = -i // k = -5
    var l: Int64 = -j // l = -100
    Assert.equals(-5, k)
    Assert.equals(-100, l)
}
