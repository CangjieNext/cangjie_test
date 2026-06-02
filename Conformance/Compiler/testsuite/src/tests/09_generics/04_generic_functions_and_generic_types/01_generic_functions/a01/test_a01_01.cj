/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_01_a01_01

  @Level:         1

  @Assertion: 9.4.1(1) If a function is declared with on or more type parameters, it is called a generic function. 
              Syntax-wise, type parameters are placed immediately after the function name and are enclosed in <>.

  @Description: Check generic function declaration.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func id<T>(x: T) {
    return x
}

func makePair<T1, T2>(x1: T1, x2: T2) {
    return (x1, x2)
}

main() {
    Assert.isTrue(id<String>("hello world") is String)
    Assert.isTrue(makePair<Int32, Float32>(42, 35.0)[0] is Int32)
    Assert.isTrue(makePair<Int32, Float32>(42, 35.0)[1] is Float32)
}

