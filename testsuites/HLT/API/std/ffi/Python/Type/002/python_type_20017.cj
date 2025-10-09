/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f %link-python -o %output
// RUN-EXEC: %export cjStackSize=1MB && %run %run_opt %output %run_args

import std.ffi.python.*
import std.log.*
import std.math.*

var x = Python.load()

func assertNotAvailable(x: PyObj) {
    if (x.isAvailable()) {
        throw Exception("")
    }
}

func assertAvailable(x: PyObj) {
    if (!x.isAvailable()) {
        throw Exception("")
    }
}

func assertEqual(x: PyLong, y: PyLong) {
    if (x.toCjObj() != y.toCjObj()) {
        throw Exception("${x} ${y} not equal!")
    }
}

func assertEqual(x: PyBool, y: PyBool) {
    if (x.toCjObj() != y.toCjObj()) {
        throw Exception("${x} ${y} not equal!")
    }
}

func assertEqual(x: PyString, y: PyString) {
    if (x.toCjObj() != y.toCjObj()) {
        throw Exception("${x} ${y} not equal!")
    }
}

func assertEqual(x: PyFloat, y: PyFloat) {
    if (x.toCjObj() != y.toCjObj()) {
        throw Exception("x:${x} , y:${y} not equal!")
    }
}

func toPyLong(x: PyObj): PyLong {
    return match (x) {
        case i: PyLong => i
        case _ => throw Exception()
    }
}

func toPyFloat(x: PyObj): PyFloat {
    return match (x) {
        case i: PyFloat => i
        case _ => throw Exception()
    }
}

func toPyString(x: PyObj): PyString {
    return match (x) {
        case i: PyString => i
        case _ => throw Exception()
    }
}

main(): Int64 {
    var a = 1.toPyObj()
    var b = "s".toPyObj()
    var c = 0.1.toPyObj()
    var d = true.toPyObj()

    assertEqual(toPyString(b + b), PyString("ss"))
    assertNotAvailable(b + a)
    assertNotAvailable(b + c)
    assertNotAvailable(b + d)

    assertNotAvailable(b - b)
    assertNotAvailable(b - a)
    assertNotAvailable(b - c)
    assertNotAvailable(b - d)

    assertNotAvailable(b * b)
    assertEqual(toPyString(b * a), PyString("s"))
    assertNotAvailable(b * c)
    assertEqual(toPyString(b * d), PyString("s"))

    assertNotAvailable(b % a)
    assertNotAvailable(b % b)
    assertNotAvailable(b % c)
    assertNotAvailable(b % d)

    assertNotAvailable(b / b)
    assertNotAvailable(b / a)
    assertNotAvailable(b / c)
    assertNotAvailable(b / d)

    assertNotAvailable(b ** a)
    assertNotAvailable(b ** b)
    assertNotAvailable(b ** c)
    assertNotAvailable(b ** d)

    assertNotAvailable(a + b)
    assertEqual(toPyFloat(a + c), PyFloat(1.1))
    assertEqual(toPyLong(a + d), PyLong(2))
    assertEqual(toPyLong(a + a), PyLong(2))

    assertEqual(toPyLong(a - a), PyLong(0))
    assertNotAvailable(a - b)
    assertEqual(toPyFloat(a - c), PyFloat(0.9))
    assertEqual(toPyLong(a - d), PyLong(0))

    assertEqual(toPyString(a * b), PyString("s"))
    assertEqual(toPyLong(a * a), PyLong(1))
    assertEqual(toPyFloat(a * c), PyFloat(0.1))
    assertEqual(toPyLong(a * d), PyLong(1))

    assertEqual(toPyLong(a % a), PyLong(0))
    assertNotAvailable(a % b)
    assertEqual(toPyFloat(a % c), PyFloat(0.09999999999999995))
    assertAvailable(a % c)
    assertEqual(toPyLong(a % d), PyLong(0))

    assertAvailable(a / a)
    assertEqual(toPyFloat(a / a), PyFloat(1.0))
    assertNotAvailable(a / b)
    assertEqual(toPyFloat(a / c), PyFloat(10.0))
    assertEqual(toPyFloat(a / d), PyFloat(1.0))

    assertEqual(toPyLong(a ** a), PyLong(1))
    assertNotAvailable(a ** b)
    assertEqual(toPyFloat(a ** c), PyFloat(1.0))
    assertEqual(toPyLong(a ** d), PyLong(1))

    assertNotAvailable(c + b)
    assertEqual(toPyFloat(c + c), PyFloat(0.2))
    assertEqual(toPyFloat(c + a), PyFloat(1.1))
    assertEqual(toPyFloat(c + d), PyFloat(1.1))

    assertEqual(toPyFloat(c - a), PyFloat(-0.9))
    assertNotAvailable(c - b)
    assertEqual(toPyFloat(c - c), PyFloat(-0.0))
    assertEqual(toPyFloat(c - d), PyFloat(-0.9))

    assertNotAvailable(c * b)
    assertEqual(toPyFloat(c * a), PyFloat(0.1))
    assertEqual(toPyFloat(c * c), PyFloat(0.010000000000000002))
    assertEqual(toPyFloat(c * d), PyFloat(0.1))

    assertEqual(toPyFloat(c % a), PyFloat(0.1))
    assertNotAvailable(c % b)
    assertEqual(toPyFloat(c % c), PyFloat(0.0))
    assertEqual(toPyFloat(c % d), PyFloat(0.1))

    assertEqual(toPyFloat(c / a), PyFloat(0.1))
    assertNotAvailable(c / b)
    assertEqual(toPyFloat(c % c), PyFloat(0.0))
    assertEqual(toPyFloat(c % d), PyFloat(0.1))

    assertEqual(toPyFloat(c ** a), PyFloat(0.1))
    assertNotAvailable(c ** b)
    assertEqual(toPyFloat(c ** c), PyFloat(0.7943282347242815))
    assertEqual(toPyFloat(c ** d), PyFloat(0.1))

    assertNotAvailable(d + b)
    assertEqual(toPyFloat(d + c), PyFloat(1.1))
    assertAvailable(d + c)
    assertEqual(toPyLong(d + d), PyLong(2))
    assertEqual(toPyLong(d + a), PyLong(2))

    assertNotAvailable(d - b)
    assertEqual(toPyFloat(d - c), PyFloat(0.9))
    assertEqual(toPyLong(d - d), PyLong(0))
    assertEqual(toPyLong(d - a), PyLong(0))

    assertEqual(toPyString(d * b), PyString("s"))
    assertEqual(toPyFloat(d * c), PyFloat(0.1))
    assertEqual(toPyLong(d * d), PyLong(1))
    assertEqual(toPyLong(d * a), PyLong(1))

    assertNotAvailable(d % b)
    assertEqual(toPyFloat(d % c), PyFloat(0.09999999999999995))
    assertEqual(toPyLong(d % d), PyLong(0))
    assertEqual(toPyLong(d % a), PyLong(0))

    assertNotAvailable(d / b)
    assertEqual(toPyFloat(d / c), PyFloat(10.0))
    assertEqual(toPyFloat(d / d), PyFloat(1.0))
    assertEqual(toPyFloat(d / a), PyFloat(1.0))

    assertNotAvailable(d ** b)
    assertEqual(toPyFloat(d ** c), PyFloat(1.0))
    assertEqual(toPyLong(d ** d), PyLong(1))
    assertEqual(toPyLong(d ** a), PyLong(1))

    return 0
}
