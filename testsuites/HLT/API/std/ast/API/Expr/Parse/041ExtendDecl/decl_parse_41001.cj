/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %use_ast %f -o %output 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    var input: Tokens = quote(
        extend<Int64> A<Int64> {func foo() {}}
    )
    let expr = parseDecl(input)
    if (expr.isExtendDecl()) {
        var b = expr.asExtendDecl()
        b.getIdentifier()
        return 0
    }
    return 1
}
// ASSERT: scan sema_not_member_of
