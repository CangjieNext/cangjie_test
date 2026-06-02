/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_01_a02_01

  @Level:         1

  @Assertion: 9.4.1(2) Multiple type parameters are separate by ,.

  @Description: Check generic function declaration with multiple type parameters.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func makePair<T1, T2>(x1: T1, x2: T2) {
    return (x1, x2)
}

main() {
    Assert.isTrue(makePair<Int32, Float32>(42, 35.0)[0] is Int32)
    Assert.isTrue(makePair<Int32, Float32>(42, 35.0)[1] is Float32)
}

