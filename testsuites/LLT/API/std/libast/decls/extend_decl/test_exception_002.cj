// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan parsing decl error

internal import std.ast.*

main(): Int64 {
    var input: Tokens = quote(
        extend<Int64> A<Int64> {func foo() {}}
    )
    let expr = parseDecl(input)
    if (expr is ExtendDecl) {
        var b = match (expr as ExtendDecl) {
            case Some(v) => v
            case None => throw Exception("Not ExtendDecl")
        }
        b.identifier.dump()
        return 0
    }
    return 1
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
