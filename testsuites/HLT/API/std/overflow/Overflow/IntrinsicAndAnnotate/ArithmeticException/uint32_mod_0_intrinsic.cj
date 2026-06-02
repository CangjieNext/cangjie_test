/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 
import std.overflow.*
import std.math.*

var temp: UInt32 = 1

func f1() {
    return temp - 1
}

@OverflowWrapping
func testWrapping(x: UInt32, y: UInt32): UInt32 {
    return x % y
}

@OverflowSaturating
func testSaturating(x: UInt32, y: UInt32): UInt32 {
    return x % y
}

@OverflowThrowing
func testThrowing(x: UInt32, y: UInt32): UInt32 {
    return x % y
}

main() {
    let a: UInt32 = UInt32.Min
    let b = "ArithmeticException: Divided by zero!"
    var count = 0
    try {
        a.wrappingMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (b != e.toString()) {
            return 1
        }
    }
    try {
        testWrapping(a, f1())
    } catch (e: ArithmeticException) {
        count++
        if (b != e.toString()) {
            return 2
        }
    }
    try {
        a.saturatingMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (b != e.toString()) {
            return 3
        }
    }
    try {
        testSaturating(a, f1())
    } catch (e: ArithmeticException) {
        count++
        if (b != e.toString()) {
            return 4
        }
    }
    try {
        testThrowing(a, f1())
    } catch (e: ArithmeticException) {
        count++
        if (b != e.toString()) {
            return 5
        }
    }
    try {
        a.throwingMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (b != e.toString()) {
            return 6
        }
    }
    if (count != 6) {
        return 7
    }
    return 0
}
