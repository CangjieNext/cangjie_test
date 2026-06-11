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

// Deep prefix-unary chain (`!!!!...!true`). Each `!` adds one level to
// the ParseUnaryExpr -> ParseBaseExpr recursion, which used to SIGSEGV
// on the 128 KB coroutine stack (UsersForum issue 3128, timeout_06.cj /
// timeout_07.cj family). The parse FFI entries now run on a dedicated
// thread whose stack is sized from the token count, and
// std.ast::createUnaryExpr decodes the right-nested UnaryExpr chain
// iteratively, so a 20000-deep chain must parse into one top-level decl
// on any coroutine stack size.
main() {
    let depth = 20000
    let sb = StringBuilder()
    sb.append("var a = ")
    for (_ in 0..depth) {
        sb.append("!")
    }
    sb.append("true")
    let p = parseProgram(cangjieLex(sb.toString()))
    println("decls=${p.decls.size}")
    0
}

// ASSERT: scan decls=1
