/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_07_a01_04

  @Level:         1

  @Assertion: 9.7(1) In the CangJie programming language, overloading between generic functions and between generic
              functions and non-generic functions is supported. For details about the definition of overloading,
              see Section Function Overloading.

  @Description: Check support for overloading between generic functions and non-generic functions with different
                argument types.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func foo(x: Int64, y: Int64) {
    return 1
}

func foo<T>(x: T, y: String) {
    return 2
}

main() {
    Assert.equals(1, foo(42, 42))
    Assert.equals(2, foo(42, "hello world"))
}

