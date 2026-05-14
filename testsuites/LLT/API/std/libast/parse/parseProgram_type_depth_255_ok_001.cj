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

// Boundary positive case for ParseType nesting guard.
// MAX_PARSER_NESTING_DEPTH = 256. A `S<S<...<Int64>>>` chain with 255
// levels reaches parser depth = 256 (255 type-args + 1 for the innermost
// `Int64`), which is exactly at the limit (<=256), so no diagnostic fires
// and the Program parses successfully.
//
// Together with parseProgram_type_depth_256_err_001 this pins the boundary:
// depth-255 succeeds, depth-256 fails.
main() {
    var code = "var x: "
    let depth = 255
    for (_ in 0..depth) {
        code = code + "S<"
    }
    code = code + "Int64"
    for (_ in 0..depth) {
        code = code + ">"
    }
    code = code + " = 0"
    let p = parseProgram(cangjieLex(code))
    println("decls=${p.decls.size}")
    0
}

// ASSERT: scan decls=1
