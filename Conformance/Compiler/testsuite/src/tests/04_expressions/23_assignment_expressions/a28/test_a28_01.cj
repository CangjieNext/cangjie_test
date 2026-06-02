
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a28_01

  @Level:         1

  @Assertion:   4.23(28) For example, when there is a subtype relation A <: B <: C, if the user overloads + with type
  (B, Int64) -> B or (B, Int64) -> A, Cangjie will provide a default implementation; if the user overloads + with type
  (Int64, Int64) -> A, Cangjie will not provide a default implementation.
  @Description: Checks that default implementation for += is provided when there there is a subtype relation
                A <: B <: C and overloading for + with type (B, Int64) -> B is present.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

open class C {
    var i : Int64 = 0

    init(x : Int64) { i = x }
}

open class B <: C {
    init(x : Int64) { super(x) }

    operator func +(x : Int64) {
        B(i + x)
    }
}

class A <: B {
    init(x : Int64) { super(x) }
}

main() {
    var b = B(1)
    b += 7
    Assert.equals(8, b.i)
}

