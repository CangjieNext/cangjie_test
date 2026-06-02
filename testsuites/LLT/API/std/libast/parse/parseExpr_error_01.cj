// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %noColor 2>&1 | compare %f

internal import std.ast.*

main() {
    let x = quote(x +%1)
    parseExpr(x)
    0
}

// ASSERT: scan expected expression after '+', found '%'
// ASSERT: regex-begin .*\|.*x \+ \% 1
// ASSERT: scan-next ^ expected expression here
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing expr error.
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
