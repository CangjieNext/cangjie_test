/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 6553565535
// ASSERT: scan 42949672954294967295
// ASSERT: scan 1844674407370955161518446744073709551615

internal import std.env.*
internal import std.math.*

main() {
    var a2: UInt16 = UInt16.Max
    getStdOut().write(a2)
    getStdOut().writeln(a2)

    var a4: UInt32 = UInt32.Max
    getStdOut().write(a4)
    getStdOut().writeln(a4)

    var a6: UInt64 = UInt64.Max
    getStdOut().write(a6)
    getStdOut().writeln(a6)
    return 0
}
