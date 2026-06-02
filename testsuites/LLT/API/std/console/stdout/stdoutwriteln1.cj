/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan qwert
// ASSERT: scan 测试测试测试
// ASSERT: scan 123456

internal import std.console.*

main() {
    Console.stdOut.writeln("qwert")
    Console.stdOut.writeln("测试测试测试")
    Console.stdOut.writeln("123456")
    return 0
}
