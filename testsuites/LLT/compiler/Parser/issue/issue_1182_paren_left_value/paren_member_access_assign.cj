// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// Regression test for issue #1182: a parenthesized member access chain is a valid
// left-hand side of an assignment, e.g. `(d.c).b.a.value = 2`. Parentheses are
// transparent for left-value purposes, so all parenthesized variants below must be
// accepted and must write the value through to the innermost field at runtime.
class A {
    var value = 0
}

class B {
    var a = A()
}

class C {
    var b = B()
}

class D {
    var c = C()
}

main(): Int64 {
    let d = D()
    d.c.b.a.value = 2
    if (d.c.b.a.value != 2) {
        return 1
    }
    (d.c).b.a.value = 3
    if (d.c.b.a.value != 3) {
        return 2
    }
    ((d.c)).b.a.value = 4
    if (d.c.b.a.value != 4) {
        return 3
    }
    (d.c.b).a.value = 5
    if (d.c.b.a.value != 5) {
        return 4
    }
    (d.c.b.a).value = 6
    if (d.c.b.a.value != 6) {
        return 5
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
