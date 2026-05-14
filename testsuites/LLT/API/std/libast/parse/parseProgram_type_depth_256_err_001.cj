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

// Boundary negative case for ParseType nesting guard.
// MAX_PARSER_NESTING_DEPTH = 256. A chain with 256 levels of `S<` causes
// the 257th ParseType call (MAX+1) to fire parse_exceeded_max_nesting_depth.
// NestingScope::CheckOverflowReportOnce emits the diagnostic exactly once
// (only at depth == MAX+1) and returns a broken InvalidType node so the
// parser unwinds cleanly instead of crashing.
//
// Together with parseProgram_type_depth_255_ok_001 this pins the boundary:
// depth-255 succeeds, depth-256 fails.
main() {
    var code = "var x: "
    let depth = 256
    for (_ in 0..depth) {
        code = code + "S<"
    }
    code = code + "Int64"
    for (_ in 0..depth) {
        code = code + ">"
    }
    code = code + " = 0"
    parseProgram(cangjieLex(code))
    0
}

// ASSERT: scan exceeded maximum nesting depth while parsing
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing program error.
