/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %use_ast %f -o %output 2>&1 |compare %f


import std.ast.*

main() {
    var input: Tokens = quote((a,b)
    let expr = parseExpr(input)
    if (!(expr is TupleLiteral)) {
        return 0
    }
    return 5
}
// ASSERT: scan parse_expected_right_delimiter
