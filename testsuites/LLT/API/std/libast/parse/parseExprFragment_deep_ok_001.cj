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

// The fragment-parsing entry points share the same C2N FFI path
// (CJ_AST_ParseExpr with a token counter) and the same decoders as
// parseProgram, so they are covered by the same fix: the dedicated parse
// thread sized from the token count plus the iterative ReturnExpr
// decoder. A 20000-deep `return` chain must parse through
// parseExprFragment without crashing or overflowing on any coroutine
// stack size.
main() {
    let depth = 20000
    let sb = StringBuilder()
    for (_ in 0..depth) {
        sb.append("return ")
    }
    sb.append("0")
    let (expr, count) = parseExprFragment(cangjieLex(sb.toString()))
    println("fragment-ok isReturn=${expr is ReturnExpr} count-positive=${count > 0}")
    0
}

// ASSERT: scan fragment-ok isReturn=true count-positive=true
