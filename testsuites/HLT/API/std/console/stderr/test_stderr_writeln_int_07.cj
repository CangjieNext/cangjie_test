/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
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

import std.console.*
import std.math.*

main() {
    //Int8
    Console.stdErr.writeln(Int8.Min)
    Console.stdErr.writeln(Int8.Max)
    Console.stdErr.writeln(0i8)
    Console.stdErr.writeln(100i8)

    //Int16
    Console.stdErr.writeln(Int16.Min)
    Console.stdErr.writeln(Int16.Max)
    Console.stdErr.writeln(0i16)
    Console.stdErr.writeln(100i16)

    //Int32
    Console.stdErr.writeln(Int32.Min)
    Console.stdErr.writeln(Int32.Max)
    Console.stdErr.writeln(0i32)
    Console.stdErr.writeln(100i32)

    //Int64
    Console.stdErr.writeln(Int64.Min)
    Console.stdErr.writeln(Int64.Max)
    Console.stdErr.writeln(0i64)
    Console.stdErr.writeln(100i64)
    Console.stdErr.flush()
    return 0
}
