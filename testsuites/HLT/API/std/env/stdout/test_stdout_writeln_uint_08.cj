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
// ASSERT: scan 0
// ASSERT: scan 255
// ASSERT: scan 0
// ASSERT: scan 100
// ASSERT: scan 0
// ASSERT: scan 65535
// ASSERT: scan 0
// ASSERT: scan 100
// ASSERT: scan 0
// ASSERT: scan 4294967295
// ASSERT: scan 0
// ASSERT: scan 100
// ASSERT: scan 0
// ASSERT: scan 18446744073709551615
// ASSERT: scan 0
// ASSERT: scan 100

import std.env.*
import std.math.*

main() {
    //UInt8
    getStdOut().writeln(UInt8.Min)
    getStdOut().writeln(UInt8.Max)
    getStdOut().writeln(0u8)
    getStdOut().writeln(100u8)

    //UInt16
    getStdOut().writeln(UInt16.Min)
    getStdOut().writeln(UInt16.Max)
    getStdOut().writeln(0u16)
    getStdOut().writeln(100u16)

    //UInt32
    getStdOut().writeln(UInt32.Min)
    getStdOut().writeln(UInt32.Max)
    getStdOut().writeln(0u32)
    getStdOut().writeln(100u32)

    //UInt64
    getStdOut().writeln(UInt64.Min)
    getStdOut().writeln(UInt64.Max)
    getStdOut().writeln(0u64)
    getStdOut().writeln(100u64)
    return 0
}
