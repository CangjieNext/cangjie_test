/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a02_01

  @Level:         1

  @Assertion:    1.1(2) There are two kinds of of identifiers: ordinary
                 identifiers and raw identifiers.

  @Description:  Check both kinds of identifier in the same function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var a1: Int64 = 1
    var a2: Int64 = 2
    var `aa1`: Int64 = 22
    var `aa2`: Int64 = 33
    func `f`() { 0 }
    Assert.equals(1, a1);
    Assert.equals(2, a2);
    Assert.equals(22, `aa1`);
    Assert.equals(33, `aa2`);
    Assert.equals(0, `f`());
}
