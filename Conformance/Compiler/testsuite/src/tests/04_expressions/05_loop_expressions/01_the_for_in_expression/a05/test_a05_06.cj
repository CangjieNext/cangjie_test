/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a05_06

  @Level:         1

  @Assertion: 4.5.1(5) At the semantic check stage, it is checked whether the pattern after for
              is actually irrefutable, if not, it is a compile-time error.
  @Description: Checks that use of irrefutable enum pattern is OK
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

enum E { Foo(Int64) }

func test1() {
    var count = 0
    for (Foo(_) in [Foo(1), Foo(1)]) {
        count++
    }
    Assert.equals(2, count)
}

func test2() {
    var count = 0
    for (Foo(x) in [Foo(1), Foo(1)]) {
        Assert.equals(1, x)
        count++
    }
    Assert.equals(2, count)
}

main() {
    test1()
    test2()
}
