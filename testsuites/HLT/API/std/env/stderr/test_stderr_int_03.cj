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

import std.env.*
import std.math.*

main() {
    //Int8
    getStdErr().write(Int8.Min)
    getStdErr().write(Int8.Max)
    getStdErr().write(0i8)
    getStdErr().write(100i8)

    //Int16
    getStdErr().write(Int16.Min)
    getStdErr().write(Int16.Max)
    getStdErr().write(0i16)
    getStdErr().write(100i16)

    //Int32
    getStdErr().write(Int32.Min)
    getStdErr().write(Int32.Max)
    getStdErr().write(0i32)
    getStdErr().write(100i32)

    //Int64
    getStdErr().write(Int64.Min)
    getStdErr().write(Int64.Max)
    getStdErr().write(0i64)
    getStdErr().write(100i64)
    getStdErr().flush()
    return 0
}
