
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a14_01

  @Level:         1

  @Assertion:   4.23(14) In above, e1 and e2 must be expressions that satisfy the syntax of leftAuxExpression.
  @Description: Checks that assignment to e1.a, e2?.a, e1[a] and e2?[a] is permitted for various leftAuxExpressions
                e1 and e2.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

open class A {
    static var s : Int64 = 0

    var x : Int64 = 0

    operator func [](y : Int64) { x }

    operator func [](y : Int64, value! : Int64) { x = value }
}

class B <: A {
    func f() {
        super.x += 1
        this.x -= 2
        super[3] *= 4
        this[5] /= 6
        A.s %= 7
        x <<= 8
        g<Float16>()[9] >>= 10
        g<Unit>()[11] ^= 12
    }

    func g<T>() { this }
}

main() {
    var b : ?B = B()
    b?.x = 0
    b?.f()
    0
}
