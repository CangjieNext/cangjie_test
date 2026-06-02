/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 3.1406253.140625
// ASSERT: scan-2 3.1415933.141593

internal import std.env.*
internal import std.math.*

main() {
    var a: Float16 = 3.14
    getStdOut().write(a)
    getStdOut().writeln(a)

    var a3: Float32 = 3.1415926
    getStdOut().write(a3)
    getStdOut().writeln(a3)

    var a5: Float64 = 3.1415926
    getStdOut().write(a5)
    getStdOut().writeln(a5)

    return 0
}
