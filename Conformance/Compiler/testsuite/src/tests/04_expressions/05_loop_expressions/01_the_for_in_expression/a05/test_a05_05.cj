/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a05_05

  @Level:         1

  @Assertion: 4.5.1(5) At the semantic check stage, it is checked whether the pattern after for
              is actually irrefutable, if not, it is a compile-time error.
  @Description: Checks that use of irrefutable tuple pattern is OK
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

func test1() {
    var count = 0
    for ((x, y) in [(1, 'a'), (1, 'a')]) {
        Assert.equals(1, x)
        Assert.equals('a', y)
        count++
    }
    Assert.equals(2, count)
}

enum E { Foo(Int64) }

func test2() {
    var count = 0
    for ((Foo(x), _) in [(Foo(1), 'a'), (Foo(1), 'a')]) {
        Assert.equals(1, x)
        count++
    }
    Assert.equals(2, count)
}

func test3() {
    var count = 0
    for ((Foo(x), y) in [(Foo(1), 'a'), (Foo(1), 'a')]) {
        Assert.equals(1, x)
        Assert.equals('a', y)
        count++
    }
    Assert.equals(2, count)
}


main() {
    test1()
    test2()
    test3()
}
