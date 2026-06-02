// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {}

class B {
    func g() {
        1
    }
}

struct C {}

func m() {
    1
}

var g: (Int64, Int64) = (1, 1)

enum hihi {
    Day | Night
}

var c: Int64 = 1
var f = 1.0
var a: Array<Any> = [A(), B(), C(), 11111, 1.0, c]

func testAny(a: Any) {}

func testAnyReturn1(): Any {
    return Int64(1)
}

func testAnyReturn2(): Any {
    return 1
}

func testAnyReturn3(): Any {
    return 1.0
}

func testAnyReturn4(): Any {
    return c
}

func testAnyReturn5(): Any {
    return f
}

func testAnyReturn6(): Any {
    return m()
}

func testAnyReturn7(): Any {
    return m
}

func testAnyReturn8(): Any {
    return B().g()
}

func testAnyReturn9(): Any {
    return g
}

func testAnyReturn10(): Any {
    return B().g
}

func testAnyReturn11(): Any {
    return a
}

func testAnyReturn13(): Any {
    return hihi.Day
}

main() {
    var d: Any
    d = Int64(1)
    d = 1
    d = 1.0
    d = c
    d = f
    d = m() // func call
    d = m //  func ptr
    d = B().g() // func call
    d = g // tuple
    d = B().g // func ptr
    d = a // array
    d = hihi.Day //  enum
    d = (1, 2) // tuple lit
    d = {=> 123} // lambda
    d = ()
    d = 0..1

    var e1: Any = Int64(1)
    var e2: Any = 1
    var e3: Any = 1.0
    var e4: Any = c
    var e5: Any = f
    var e6: Any = m()
    var e7: Any = m //  : func
    var e8: Any = B().g()
    var e9: Any = g // : tuple
    var e10: Any = B().g // : func
    var e11: Any = a //  :: array
    var e13: Any = hihi.Day // : enum
    var e14: Any = (1, 2)
    var e15: Any = {=> 123} // : enum
    var e16: Any = ()

    if (match (e16) {
        case _: Unit => "right"
        case _ => "error"
    } == "error") {
        return 1
    }

    testAny(Int64(1))
    testAny(1)
    testAny(1.0)
    testAny(c)
    testAny(f)
    testAny(m())
    testAny(m) //  : func
    testAny(B().g())
    testAny(g) // : tuple
    testAny(B().g) // : func
    testAny(a) //  :: array
    testAny(hihi.Day) // : enum
    testAny(())
    return 0
}
