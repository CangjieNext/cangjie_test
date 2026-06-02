// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface C {
    func f(): String
}

struct A {}

extend A <: C {
    public func f(): String {
        "A"
    }
}

class B {
    public B(i!: C = A()) {}
    public init(i!: C = A(), j!: C) {}
    public func fffff(i!: C = A()) {}
    public static func ggggg(i!: C = A()) {}
}

extend B <: C {
    public func f(): String {
        "B"
    }
}

// DEFAULT VALUE
func ff(i!: C = A(), d!: C = B(i: A()), c!: C = if (true) {
        A()
    } else {
        B()
    }, e!: C = B(i: if (true) {
        A()
    } else {
        A()
    })) {
    i.f()
    c.f()
}

// ReturnExpr
func fff(): C {
    var a: C = A() // VARDECL
    if (true) {
        return a
    } else {
        A()
    }
}

func fff2(): C {
    var a: C = A() // VARDECL
    if (true) {
        return A()
    } else {
        A()
    }
}

// ReturnExpr
func ffff(): C {
    A()
}

// CALLEXPR
func call1(a!: C) {
    a.f()
}

func call2(a!: C, b!: Int64, c!: Int64 = 100) {
    a.f()
}

func call3(c: Int64, a: C, b!: Int64 = 1) {
    a.f()
}

func call4(c: Int64, a: C, b: Int64) {
    a.f()
}

main() {
    var a1: () -> C = {=> A()}
    a1().f()
    var b1: () -> C = {=> B(i: A())}
    b1().f()
    a1 = {=> A()}
    a1().f()
    b1 = {=> B(i: A())}
    b1().f()

    B().fffff()
    B(i: A()).fffff(i: A())
    B.ggggg()
    B.ggggg(i: A())
    var a: C
    // ASSIGNEXPR
    a = A()
    if (a.f() != "A") {
        return 1
    }
    if (fff().f() != "A") {
        return 1
    }
    if (ffff().f() != "A") {
        return 1
    }
    if (fff2().f() != "A") {
        return 1
    }
    // default funcparam
    ff()
    ff(i: A())
    // CALLEXPR
    call1(a: A())
    call2(b: 0, a: A())
    call3(0, A())
    if (call3(0, if (true) {
        A()
    } else {
        A()
    }) != "A") {
        return 1
    }
    if (call3(0, if (true) {
        a
    } else {
        A()
    }) != "A") {
        return 1
    }
    if (call4(0, if (true) {
        a
    } else {
        A()
    }, 1) != "A") {
        return 1
    }

    if (match (A()) {
        case c: C => c.f()
        case _ => "Error"
    } != "A") {
        return 1
    }
    /*
    if (match (a) {
        case c: B => c.f()
        case b: A => b.f()
        case _ => "Error"
    } != "A") {
        return 1
    }
     */
    a = B()

    if (match (a) {
        case c: B => c.f()
        case b: A => b.f()
        case _ => "Error"
    } != "B") {
        return 1
    }

    if (match (a) {
        case c: C => c.f()
        case _ => "Error"
    } != "B") {
        return 1
    }
    return 0
}
