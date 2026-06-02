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
// ASSERT: scan 0255010006553501000429496729501000184467440737095516150100

import std.console.*
import std.math.*

main() {
    //UInt8
    Console.stdErr.write(UInt8.Min)
    Console.stdErr.write(UInt8.Max)
    Console.stdErr.write(0u8)
    Console.stdErr.write(100u8)

    //UInt16
    Console.stdErr.write(UInt16.Min)
    Console.stdErr.write(UInt16.Max)
    Console.stdErr.write(0u16)
    Console.stdErr.write(100u16)

    //UInt32
    Console.stdErr.write(UInt32.Min)
    Console.stdErr.write(UInt32.Max)
    Console.stdErr.write(0u32)
    Console.stdErr.write(100u32)

    //UInt64
    Console.stdErr.write(UInt64.Min)
    Console.stdErr.write(UInt64.Max)
    Console.stdErr.write(0u64)
    Console.stdErr.write(100u64)
    return 0
}
