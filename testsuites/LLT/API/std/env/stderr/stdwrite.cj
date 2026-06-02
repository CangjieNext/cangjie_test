/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan cdefg
// ASSERT: scan 23456

internal import std.env.*

main() {
    var array: Array<UInt8> = [99, 100, 101, 102, 103]
    var array2: Array<UInt8> = [50, 51, 52, 53, 54]
    getStdErr().writeln(array)
    getStdErr().write(array2)
    return 0
}
