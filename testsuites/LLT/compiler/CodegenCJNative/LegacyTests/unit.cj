// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func RetUnit(a: Unit, b: Unit): Unit {
    let c = a
    return c
}

let g = ()
let h = g

struct A {
    public var a: Unit
    public var b: Int32
    public var c: Unit
    public var d: Int32
    public init(a: Unit, b: Int32, c: Unit, d: Int32) {
        this.a = a
        this.b = b
        this.c = c
        this.d = d
    }
}

class B {
    public var a: Unit = RetUnit(h, g)
    public var b: Int32 = 1
    public static var c: Unit = ()
    public init(aa: Unit) {
        a = aa
    }
}

interface C {}

func codegenUnitTest(): Int32 {
    let a = ()
    var b: Unit = a
    let myArray: Array<Unit> = [(), a, RetUnit(a, b), B.c]
    b = RetUnit(a, RetUnit(a, b))
    var c = A(a, 3, b, 4)
    if (a == b) {
        var bb = B(a)
        bb.b = 1
        return c.b + c.d + bb.b
    }
    return 0
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 8) {
        return 0
    } else {
        return -1
    }
}
