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
// ASSERT: scan -1281270100-32768327670100-214748364821474836470100-922337203685477580892233720368547758070100

import std.console.*
import std.math.*

main() {
    //Int8
    Console.stdOut.write(Int8.Min)
    Console.stdOut.write(Int8.Max)
    Console.stdOut.write(0i8)
    Console.stdOut.write(100i8)

    //Int16
    Console.stdOut.write(Int16.Min)
    Console.stdOut.write(Int16.Max)
    Console.stdOut.write(0i16)
    Console.stdOut.write(100i16)

    //Int32
    Console.stdOut.write(Int32.Min)
    Console.stdOut.write(Int32.Max)
    Console.stdOut.write(0i32)
    Console.stdOut.write(100i32)

    //Int64
    Console.stdOut.write(Int64.Min)
    Console.stdOut.write(Int64.Max)
    Console.stdOut.write(0i64)
    Console.stdOut.write(100i64)
    Console.stdOut.flush()
    return 0
}
