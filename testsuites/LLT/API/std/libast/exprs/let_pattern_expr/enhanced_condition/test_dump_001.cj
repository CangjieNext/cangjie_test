// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan expected expression after '||', found keyword 'let'

internal import std.ast.*

main(): Int64 {
    let input = quote(false || let 1 <- a)
    let expr = parseExpr(input)
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
