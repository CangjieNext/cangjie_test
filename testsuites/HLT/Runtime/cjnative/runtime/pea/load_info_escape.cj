/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan Computation result: 500
// ASSERT:scan Computation result: 500
// ASSERT:scan Computation result: 85

import std.convert.*
import std.collection.*
import std.time.*

var shouldLog = true
var blackBox: Int64 = 0
var N = 8

main(args: Array<String>): Unit {
    measureObject(N)
}

func measureObject(N: Int64) {
    var a = StringObject()
    blackBox = measureBodyObject(a)

    if (shouldLog) {
        println("Computation result: ${a.a.ps.ss.a}")
    }

    var c = flashStack();

    if (shouldLog) {
        println("Computation result: ${a.a.ps.ss.a}")
        blackBox = c
        println("Computation result: ${blackBox}")
    }
}

var ga = ComplexObject(0, 0)

struct StringObject {
    var str: String
    var a: ComplexObject
    init() {
        str = "abc"
        a = ComplexObject(1, 2)
    }
}

func measureBodyObject(so: StringObject) {
    var co = so.a
    var s = NumObject(500)
    co.ps.ss = s
    co.modulus2()
}

var gso: StringObject = StringObject()

func flashStack() {
    var i = 0
    var a: StringObject = StringObject()
    while (i < N) {
        var a1: StringObject = StringObject()
        a1.a.re += a.a.re
        gso = a
        a.a.re = a1.a.re
        i++
    }
    a.a.modulus2()
}

class PackedObject {
    var ss: NumObject
    init() {
        ss = NumObject()
    }
}

class NumObject {
    var a: Int64
    init() {
        a = 100
    }

    init(_a: Int64) {
        a = _a
    }
}

class ComplexObject {
    var re: Int64
    var im: Int64
    var ps: PackedObject
    init(re_: Int64, im_: Int64) {
        re = re_
        im = im_
        ps = PackedObject()
    }

    func modulus2(): Int64 {
        re * re + im * im
    }
}
