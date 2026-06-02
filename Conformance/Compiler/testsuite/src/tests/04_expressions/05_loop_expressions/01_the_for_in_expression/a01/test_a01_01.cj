/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a01_01

  @Level:         1

  @Assertion: 4.5.1(1) A complete for-in expression has the following form:
                       for (p in e where c) {
                           s
                       }
  @Description: Checks execution of some examples of loop with 'where' clause.
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import std.collection.*
import utils.assert.Assert

func test1() {
    var count = 0
    for (i in 1..=5 where false) {
        count++
    }
    Assert.equals(0, count)
}

func test2() {
    var count = 0
    for (i in 1..=5 where true) {
        count++
    }
    Assert.equals(5, count)
}

func test3() {
    var count = 0
    for (i in 1..=5 where i % 2 == 0) {
        count++
    }
    Assert.equals(2, count)
}

func test4() {
    var count = 0
    for (i in 1..=100 where i % 2 == 0) {
        if (i <= 4) {
            count++
            continue
        } else {
            break
        }
        count += 300 // unreachable
    }
    Assert.equals(2, count)
}


enum E { Foo(Int32) }

func test5() {
    var count = 0
    for (Foo(i) in [Foo(1), Foo(2), Foo(3), Foo(4), Foo(5)] where i % 2 == 0) {
        count++
    }
    Assert.equals(2, count)
}

func test6() {
    let list = ArrayList<(Int32, Float32)>()
    for (i in 1..=5 where true) {
        list.add((Int32(i), Float32(i)))
    }

    var count = 0
    for ((i, x) in list where i % 2 == 0) {
        count++
    }
    Assert.equals(2, count)
}

main() {
    test1()
    test2()
    test3()
    test4()
    test5()
    test6()
}
