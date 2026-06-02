// EXEC-0: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output --no-color %run_args 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing expr fragment error

internal import std.ast.*

main(): Int64 {
    let tokens = quote(1=1+1)
    let (a, b) = parseExprFragment(tokens, startFrom: 0)
    a.dump()
    println(b)
    let (c, d) = parseExprFragment(tokens, startFrom: b)
    return 0;
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
