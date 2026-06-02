// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan parsing decl error.

internal import std.ast.*

main(): Int64 {
    let input = quote(
        public func foo(a: Int32) : Int32 {
            let b = a + 1
            return b
        }
    )
    try {
        let primaryCtorDecl = PrimaryCtorDecl(input)
    } catch (e: ASTException) {
        if (e.message != "Cannot construct the 'PrimaryCtorDecl' node.") {
            return 1
        }
    }

    try {
        PrimaryCtorDecl(quote(a))
    } catch (e: ASTException) {
        println(e.message)
    }

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
