/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a02_01

  @Level:         1

  @Assertion: 4.5.1(2) The if (c) is not required, so a simpler for-in expression has the following form:
              for (p in e) {
                  s
              }

  @Description: Checks execution of some examples of simplified for-in expression
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import std.collection.*
import utils.assert.Assert


func test1() {
    var count = 0
    for (i in 1..=5) {
        count++
    }
    Assert.equals(5, count)
}

func test2() {
    var count = 0
    for (i in 1..=100) {
        if (i <= 4) {
            count++
            continue
        } else {
            break
        }
        count += 300 // unreachable
    }
    Assert.equals(4, count)
}


enum E { Foo(Int32) }

func test3() {
    var count = 0
    for (Foo(i) in [Foo(1), Foo(2), Foo(3), Foo(4), Foo(5)]) {
        count++
    }
    Assert.equals(5, count)
}

func test4() {
    let list = ArrayList<(Int32, Float32)>()
    for (i in 1..=5) {
        list.add((Int32(i), Float32(i)))
    }

    var count = 0
    for ((i, x) in list) {
        count++
    }
    Assert.equals(5, count)
}

main() {
    test1()
    test2()
    test3()
    test4()
}
