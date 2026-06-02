
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a07_01

  @Level:         1

  @Assertion:   4.23(7) Syntactically, a left value expression can be an identifier or _, or a leftAuxExpression
                followed by an assignableSuffix (containing fieldAccess and indexAccess).
  @Description: Test containing assignments of identifiers, _, and leftAuxExpressions followed by an assignableSuffix.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

open class C {
    var x = 0

    static var y = 0

    operator func[] (y : Int64) { x }

    operator func[] (y : Int64, value! : Int64) { x = y + value }
}

class D <: C {
    func g() {
        this.x += 1
        super.x -= 2
        this[3] *= 4
        super[5] /= 6
        f<Rune>().x = 7
        C.y = 8
        return this
    }

    static func f<T>() { C() }
}

func foo(x : Int64) { C() }

main() {
    var x = 0
    x = 1

    _ = 2

    D().g()[123] %= 321

    var c : ?C = C()
    c?.x = 111
    c?[222] = 333
    var f : ?(Int64) -> C = foo
    f?(7).x = 444
}
