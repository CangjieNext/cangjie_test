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

// Boundary positive case for ParseUnaryExpr nesting guard.
// `!!!!...!false` with 255 `!` tokens drives the
// ParseUnaryExpr -> ParseBaseExpr -> ParseUnaryExpr recursion to
// depth 256 (exactly at MAX_PARSER_NESTING_DEPTH), so no diagnostic fires
// and the Program parses successfully with one top-level decl.
//
// Together with parseProgram_unary_depth_256_err_001 this pins the boundary.
main() {
    var code = "main() { let a = "
    let depth = 255
    for (_ in 0..depth) {
        code = code + "!"
    }
    code = code + "false }"
    let p = parseProgram(cangjieLex(code))
    println("decls=${p.decls.size}")
    0
}

// ASSERT: scan decls=1
