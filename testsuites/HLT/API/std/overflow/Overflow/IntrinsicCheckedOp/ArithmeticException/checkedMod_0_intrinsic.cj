/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1
import std.overflow.*
import std.math.*

main() {
    let a: Int8 = Int8.Min
    let b: Int16 = Int16.Max
    let c: Int32 = Int32.Max
    let d: Int64 = Int64.Max
    let e: UInt8 = UInt8.Max
    let f: UInt16 = UInt16.Max
    let g: UInt32 = UInt32.Max
    let h: UInt64 = UInt64.Max
    let compare = "ArithmeticException: Divided by zero!"
    var count = 0
    try {
        var s = a.checkedMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (compare != e.toString()) {
            return 1
        }
    }
    try {
        var s = b.checkedMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (compare != e.toString()) {
            return 2
        }
    }
    try {
        var s = c.checkedMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (compare != e.toString()) {
            return 3
        }
    }
    try {
        var s = d.checkedMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (compare != e.toString()) {
            return 4
        }
    }
    try {
        var s = e.checkedMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (compare != e.toString()) {
            return 5
        }
    }
    try {
        var s = f.checkedMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (compare != e.toString()) {
            return 6
        }
    }
    try {
        var s = g.checkedMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (compare != e.toString()) {
            return 7
        }
    }
    try {
        var s = h.checkedMod(0)
    } catch (e: ArithmeticException) {
        count++
        if (compare != e.toString()) {
            return 8
        }
    }
    if (count != 8) {
        return 9
    }
    return 0
}
