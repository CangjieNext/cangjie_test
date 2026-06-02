/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %output %f
// (Unix) RUN-EXEC-PIPE-0: echo "abcdefg" | %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE-0: echo abcdefg | %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan efg

internal import std.env.*

func func1(c: Rune): Bool {
    return c == r'd'
}

main() {
    let c = getStdIn().readUntil(func1)
    let r = getStdIn().readln().getOrThrow()
    print(r.toString())
    return 0
}
