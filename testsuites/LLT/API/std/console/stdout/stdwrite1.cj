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

internal import std.console.*

let INT8_MIN: Int8 = -128
let INT8_MAX: Int8 = 127
let UINT8_MIN: UInt8 = 0
let UINT8_MAX: UInt8 = 255

main() {
    var str = ""
    Console.stdOut.write(str)
    Console.stdOut.write(true)
    Console.stdOut.write(false)
    Console.stdOut.write(INT8_MIN)
    Console.stdOut.write(INT8_MAX)
    Console.stdOut.write(UINT8_MIN)
    Console.stdOut.write(UINT8_MAX)
    var char = r'a'
    Console.stdOut.write(char)
    Console.stdOut.writeln(true)
    Console.stdOut.writeln(false)
    Console.stdOut.writeln(INT8_MIN)
    Console.stdOut.writeln(INT8_MAX)
    Console.stdOut.writeln(UINT8_MIN)
    Console.stdOut.writeln(UINT8_MAX)
    Console.stdOut.writeln(char)
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
