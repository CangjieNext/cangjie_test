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

// Verifies that the ParseType nesting guard also protects parseDeclFragment.
// The NestingScope guard in ParseType is shared by all parse entry points.
// This test confirms that parseDeclFragment raises parse_exceeded_max_nesting_depth
// (not SIGSEGV) when given a declaration with 300 levels of type nesting.
main() {
    var code = "let x: "
    let depth = 300
    for (_ in 0..depth) {
        code = code + "S<"
    }
    code = code + "Int64"
    for (_ in 0..depth) {
        code = code + ">"
    }
    code = code + " = 0"
    parseDeclFragment(cangjieLex(code))
    0
}

// ASSERT: scan exceeded maximum nesting depth while parsing
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing decl fragment error.
