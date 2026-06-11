/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %noColor 2>&1 | compare %f

internal import std.ast.*

// Deep `return return ... 0` chain (UsersForum issue 3128,
// multi_return.cj reproducer). Each `return` token adds one level to the
// ParseExpr -> ParseAtom -> ParseReturnExpr recursion (2-4 KB of native
// frames per level), which used to SIGSEGV on the 128 KB coroutine stack.
// The parse FFI entries now run on a dedicated thread whose stack is
// sized from the token count, and std.ast::createReturnExpr decodes the
// resulting right-nested ReturnExpr chain iteratively, so a 20000-deep
// chain must parse into one top-level decl on any coroutine stack size.
main() {
    let depth = 20000
    let sb = StringBuilder()
    sb.append("func f() { ")
    for (_ in 0..depth) {
        sb.append("return ")
    }
    sb.append("0 }")
    let p = parseProgram(cangjieLex(sb.toString()))
    println("decls=${p.decls.size}")
    0
}

// ASSERT: scan decls=1
