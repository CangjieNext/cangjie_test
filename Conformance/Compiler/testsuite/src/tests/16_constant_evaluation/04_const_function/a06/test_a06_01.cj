
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a06_01

  @Level:         1

  @Assertion:   16.4(6) 3.All expressions in const functions must be const expressions, except for the const init
                function.
  @Description: Checks that const functions can have various const expressions inside their body, in addition
                const init can have instance member variables assignments.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore
  @Issue: 6614

*/

import utils.assert.Assert

enum E {
    E1 |
    E2(Int64)
} 

struct S1 {
    var v = 0
    let l = 1
    static const c = 2

    const init() { }
}

const c = 1

const func g() { 1 }

const func f(x: Int64) {
    1
    "1"
    true
    '1'
    (1, 2, 3)
    c
    g
    { => 1}
    g()
    try {
        let ll = 1
    } catch (_) {
        E.E1
        E.E2(1)
    }
    const s = S1()
    s.v
    s.l
    S1.c
    1 + 1
    true && false
    1 << 1
    1 > 1
    return x
}

struct S {
    let y: Int64
    var v: Int64

    static const func sf() {
        1
        "1"
        true
        '1'
        (1, 2, 3)
        c
        g
        { => 1}
        g()
        try {
            let ll = 1
        } catch (_) {
            E.E1
            E.E2(1)
        }
        const s = S1()
        s.v
        s.l
        S1.c
        1 + 1
        true && false
        1 > 1
        return 1 << 1
    }

    const func mf() {
        1
        "1"
        true
        '1'
        (1, 2, 3)
        c
        g
        { => 1}
        g()
        try {
            let ll = 1
        } catch (_) {
            E.E1
            E.E2(1)
        }
        const s = S1()
        s.v
        s.l
        S1.c
        1 + 1
        1 << 1
        true && false
        1 > 1
        return v + 2
    }

    const init(x: Int64) {
        1
        "1"
        true
        '1'
        (1, 2, 3)
        c
        g
        { => 1}
        g()
        try {
            let ll = 1
        } catch (_) {
            E.E1
            E.E2(1)
        }
        const s = S1()
        s.v
        s.l
        S1.c
        1 + 1
        true && false
        1 << 1
        1 > 1
        y = x + 1
        v = y + 1
    }
}

main() {
    const l = { =>
        1
        "1"
        true
        '1'
        (1, 2, 3)
        c
        g
        { => 1}
        g()
        try {
            let ll = 1
        } catch (_) {
            E.E1
            E.E2(1)
        }
        const s = S1()
        s.v
        s.l
        S1.c
        1 + 1
        true && false
        1 > 1
        return 1 << 1
    }
    Assert.equals(2, l())
    Assert.equals(1, f(1))
    Assert.equals(2, S.sf())
    const s = S(1)
    Assert.equals(2, s.y)
    Assert.equals(3, s.v)
    Assert.equals(5, s.mf())
}
