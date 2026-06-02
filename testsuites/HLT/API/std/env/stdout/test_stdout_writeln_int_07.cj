/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan -128
// ASSERT: scan 127
// ASSERT: scan 0
// ASSERT: scan 100
// ASSERT: scan -32768
// ASSERT: scan 32767
// ASSERT: scan 0
// ASSERT: scan 100
// ASSERT: scan -2147483648
// ASSERT: scan 2147483647
// ASSERT: scan 0
// ASSERT: scan 100
// ASSERT: scan -9223372036854775808
// ASSERT: scan 9223372036854775807
// ASSERT: scan 0
// ASSERT: scan 100

import std.env.*
import std.math.*

main() {
    //Int8
    getStdOut().writeln(Int8.Min)
    getStdOut().writeln(Int8.Max)
    getStdOut().writeln(0i8)
    getStdOut().writeln(100i8)

    //Int16
    getStdOut().writeln(Int16.Min)
    getStdOut().writeln(Int16.Max)
    getStdOut().writeln(0i16)
    getStdOut().writeln(100i16)

    //Int32
    getStdOut().writeln(Int32.Min)
    getStdOut().writeln(Int32.Max)
    getStdOut().writeln(0i32)
    getStdOut().writeln(100i32)

    //Int64
    getStdOut().writeln(Int64.Min)
    getStdOut().writeln(Int64.Max)
    getStdOut().writeln(0i64)
    getStdOut().writeln(100i64)
    getStdOut().flush()
    return 0
}
