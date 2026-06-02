/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.process
import std.convert.*
import std.collection.*
import std.time.*

var shouldLog = true
var blackBox: Int64 = 0

main(): Unit {
    measureObject(10)
}

func measureObject(N: Int64) {
    blackBox = measureBodyObject(N)

    if (shouldLog) {
        println("ComplexObject with ${N} problem size. Computation result: ${blackBox}")
    }
}

var ga = ComplexObject(0, 0)
var gc2 = ComplexObject2()

func measureBodyObject(N: Int64) {
    var a = ComplexObject(N, N)
    gc2 = a.c2
    var sum = 0
    sum += a.modulus2()
    return sum
}

class ComplexObject2 {}

class ComplexObject3 {}

class ComplexObject {
    var re: Int64
    var im: Int64
    var c2: ComplexObject2
    var c3: ComplexObject3
    init(re_: Int64, im_: Int64) {
        re = re_
        im = im_
        c2 = ComplexObject2()
        c3 = ComplexObject3()
    }

    func modulus2(): Int64 {
        re * re + im * im
    }
}
