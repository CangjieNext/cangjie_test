/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %noColor 2>&1 | compare %f

internal import std.ast.*

// Boundary negative case for ParseUnaryExpr nesting guard.
// `!!!!...!false` with 256 `!` tokens drives the depth to
// 257 = MAX_PARSER_NESTING_DEPTH + 1, triggering parse_exceeded_max_nesting_depth
// exactly once. Postfix forms (`.`, `()`, `[]`) are parsed by while-loops
// and are NOT affected by this guard.
//
// Together with parseProgram_unary_depth_255_ok_001 this pins the boundary.
main() {
    var code = "main() { let a = "
    let depth = 256
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
