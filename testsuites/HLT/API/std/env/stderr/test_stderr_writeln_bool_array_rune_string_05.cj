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
// ASSERT: scan true
// ASSERT: scan 23456
// ASSERT: scan canghjietest
// ASSERT: scan y

import std.env.*

main() {
    getStdErr().writeln(true)
    let array: Array<UInt8> = [50, 51, 52, 53, 54]
    getStdErr().writeln(array)
    getStdErr().writeln("canghjietest")
    getStdErr().writeln("y")
    return 0
}
