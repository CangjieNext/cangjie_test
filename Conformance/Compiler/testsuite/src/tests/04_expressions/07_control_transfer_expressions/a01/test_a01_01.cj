
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a01_01

  @Level:         1

  @Assertion:   4.7(1) Control transfer expressions change the execution order of the program, by transferring control
                from one place to another.
  @Description: Checks that control transfer expressions change the natural execution order of the program. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var s = ""

func f(b : Bool) {
    s = ""
    if (b) {
        return
    }
    s = "f"
}

func g(b : Bool) {
    s = ""
    if (b) {
        throw Exception()
    }
    s = "g"
}

main() {
    var i : Int64

    i = 0
    for (_ in 0..10) {
        i++
        if (i == 5) {
            break
        }
    }
    Assert.equals(5, i)
    Assert.notEquals(10, i)

    i = 0
    for (_ in 0..10) {
        if (i == 5) {
            continue
        }
        i++
    }
    Assert.equals(5, i)
    Assert.notEquals(10, i)

    f(false)
    Assert.equals("f", s)
    f(true)
    Assert.equals("", s)

    try {
        g(false)
        s += "t"
    } catch (e : Exception) {
        s += "c"
    }
    Assert.equals("gt", s)
    try {
        g(true)
        s += "t"
    } catch (e : Exception) {
        s += "c"
    }
    Assert.equals("c", s)
}
