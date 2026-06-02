/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f

/*
 * Test description: Test some functions in console_write.cj
 * Test API: public func write(v: String): Unit
 *           public func write(v: Bool): Unit
 *           public func write(v: Int8): Unit
 *           public func write(v: UInt8): Unit
 *           public func write(v: Rune): Unit
 *           public func writeln(v: Bool): Unit
 *           public func writeln(v: Int8): Unit
 *           public func writeln(v: UInt8): Unit
 *           public func writeln(v: Rune): Unit
 */

internal import std.env.*

let INT8_MIN: Int8 = -128
let INT8_MAX: Int8 = 127
let UINT8_MIN: UInt8 = 0
let UINT8_MAX: UInt8 = 255

main() {
    var str = ""
    getStdOut().write(str)
    getStdOut().write(true)
    getStdOut().write(false)
    getStdOut().write(INT8_MIN)
    getStdOut().write(INT8_MAX)
    getStdOut().write(UINT8_MIN)
    getStdOut().write(UINT8_MAX)
    var char = r'a'
    getStdOut().write(char)
    getStdOut().writeln(true)
    getStdOut().writeln(false)
    getStdOut().writeln(INT8_MIN)
    getStdOut().writeln(INT8_MAX)
    getStdOut().writeln(UINT8_MIN)
    getStdOut().writeln(UINT8_MAX)
    getStdOut().writeln(char)
    println(" ")
}

/* SCAN
truefalse-1281270255atrue
false
-128
127
0
255
a
 */
