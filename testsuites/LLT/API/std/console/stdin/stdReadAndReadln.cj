/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %output %f
// (Unix) RUN-EXEC-PIPE-0: echo "abc测试123" | %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE-0: echo abc测试123 | %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan abc测试123

internal import std.console.*

main() {
    let c1: Option<Rune> = Console.stdIn.read()
    let r1 = c1.getOrThrow()
    let c2: Option<Rune> = Console.stdIn.read()
    let r2 = c2.getOrThrow()
    let c3: Option<String> = Console.stdIn.readln()
    let r3 = c3.getOrThrow()
    print(r1.toString() + r2.toString() + r3)
    return 0
}
