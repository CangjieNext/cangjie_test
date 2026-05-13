// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %noColor 2>&1 | compare %f

internal import std.ast.*

// Long `return return ... return 0` chain. Each `return` recurses through
// ParseExpr -> ParseAtom -> ParseReturnExpr -> ParseExpr, so an input with
// thousands of `return` tokens (see UsersForum issue 3128:
// multi_return.cj reproducer) used to exhaust the Cangjie coroutine stack
// inside libcangjie-std-ast and SIGSEGV. The parser depth guard now bails
// out with a diagnostic before the recursion blows the stack.
main() {
    var code = "main() { "
    let depth = 300
    for (_ in 0..depth) {
        code = code + "return "
    }
    code = code + "0 }"
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
