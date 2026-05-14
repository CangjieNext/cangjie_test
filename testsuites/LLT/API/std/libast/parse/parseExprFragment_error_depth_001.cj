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

// Verifies that the ParseExpr nesting guard also protects parseExprFragment.
// The NestingScope guard is placed in ParseType / ParseExpr / ParseUnaryExpr
// which are shared by all parse entry points. This test confirms that
// parseExprFragment raises parse_exceeded_max_nesting_depth (not SIGSEGV)
// when given a 300-level `return return ... return 0` chain.
main() {
    var code = ""
    let depth = 300
    for (_ in 0..depth) {
        code = code + "return "
    }
    code = code + "0"
    parseExprFragment(cangjieLex(code))
    0
}

// ASSERT: scan exceeded maximum nesting depth while parsing
// ASSERT: scan An exception has occurred:
// ASSERT: scan parsing expr fragment error.
