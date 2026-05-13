// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %noColor 2>&1 | compare %f

internal import std.ast.*

// Long prefix-unary chain (`!!!!...!false`). Each `!` walks
// ParseUnaryExpr -> ParseBaseExpr -> ParseUnaryExpr, which is the third
// recursive parser entry guarded by NestingScope. Postfix forms
// (`a.b.c`, `a()()`, `a[i][j]`) are parsed by while-loops and do not
// need a guard — only prefix unary is recursive.
main() {
    var code = "main() { let a = "
    let depth = 300
    for (_ in 0..depth) {
        code = code + "!"
    }
    code = code + "false }"
    parseProgram(cangjieLex(code))
    0
}

// ASSERT: scan exceeded maximum nesting depth while parsing
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing program error.
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
