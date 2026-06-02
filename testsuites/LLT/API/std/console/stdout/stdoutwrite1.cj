/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan abcedf测测测测测测123456

internal import std.console.*

main() {
    Console.stdOut.write("abcedf")
    Console.stdOut.write("测测测测测测")
    Console.stdOut.write("123456")
    Console.stdOut.flush()
    return 0
}
