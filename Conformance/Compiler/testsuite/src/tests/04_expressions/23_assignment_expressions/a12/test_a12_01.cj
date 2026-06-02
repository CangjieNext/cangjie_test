
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a12_01

  @Level:         1

  @Assertion:   4.23(12) 3.Member access expression e1.a or e2?.a(see Member Access Expressions).
  @Description: Checks that assignment to a member access expression is permitted and gives correct result.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {
    static var s : Int64 = 0

    var x : Int64
    init(y : Int64) { x = y }

    operator func ==(other : C) { x == other.x }
}

struct S {
    static var s : Int64 = 0
    var x : Int64

    init(y : Int64) { x = y }
}


main() {
    var s = S(0)
    s.x = 1
    Assert.equals(1, s.x)
    var c = C(1)
    c.x = 2
    Assert.equals(2, c.x)
    C.s = 3
    Assert.equals(3, C.s)
    S.s = 4
    Assert.equals(4, S.s)
    var cq : ?C = C(1)
    cq?.x = 5
    Assert.equals(5, cq?.x ?? 0)
}