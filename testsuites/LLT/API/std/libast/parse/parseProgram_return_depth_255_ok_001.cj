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

// Boundary positive case for ParseExpr nesting guard.
// `return return ... return 0` with 255 `return` tokens drives the
// ParseExpr -> ParseAtom -> ParseReturnExpr -> ParseExpr recursion to
// depth 256 (exactly at MAX_PARSER_NESTING_DEPTH), so no diagnostic fires
// and the Program parses successfully with one top-level decl.
//
// Together with parseProgram_return_depth_256_err_001 this pins the boundary.
main() {
    var code = "main() { "
    let depth = 255
    for (_ in 0..depth) {
        code = code + "return "
    }
    code = code + "0 }"
    let p = parseProgram(cangjieLex(code))
    println("decls=${p.decls.size}")
    0
}

// ASSERT: scan decls=1
