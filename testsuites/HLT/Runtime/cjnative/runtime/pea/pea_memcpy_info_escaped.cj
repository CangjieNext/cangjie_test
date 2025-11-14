/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan Computation result: 0
// ASSERT:scan Computation result: 13
// ASSERT:scan Computation result: 85

import std.convert.*
import std.collection.*
import std.time.*

var shouldLog = true
var blackBox: Int64 = 0
var N = 8

main(): Unit {
    measureObject(N)
}

func measureObject(N: Int64) {
    var b = measureBodyObject(N)

    if (shouldLog) {
        println("Computation result: ${blackBox}")
    }

    var c = flashStack();

    blackBox = b.modulus2()

    if (shouldLog) {
        println("Computation result: ${blackBox}")
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

func measureBodyObject(N: Int64) {
    var i = 0
    var arr: Array<StringObject> = Array<StringObject>(10, repeat: StringObject())
    var a: StringObject = StringObject()
    a.a.re = 3
    while (i < N) {
        arr[i] = a
        i++
    }
    arr[0].a
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

class ComplexObject {
    var re: Int64
    var im: Int64
    init(re_: Int64, im_: Int64) {
        re = re_
        im = im_
    }

    func modulus2(): Int64 {
        re * re + im * im
    }
}
