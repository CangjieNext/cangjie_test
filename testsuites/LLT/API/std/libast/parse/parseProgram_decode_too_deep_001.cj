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

// Decode shapes that are not iterativized (here: a deep MULTI-argument
// generic nest `S<S<..., Int64>, Int64>`) still recurse once per level
// through generateTypeAST on the user's coroutine stack. At 20000 levels
// that recursion overflows on any realistic coroutine stack size. The
// contract pinned here: the overflow must surface as the documented
// ParseASTException ("nests too deeply to decode"), never as a bare
// StackOverflowError and never as a process crash. If a bare error leaks,
// main exits non-zero and EXEC-PIPE-0 fails this case.
main() {
    let depth = 20000
    let sb = StringBuilder()
    sb.append("var x: ")
    for (_ in 0..depth) {
        sb.append("S<")
    }
    sb.append("Int64")
    for (_ in 0..depth) {
        sb.append(",Int64>")
    }
    sb.append(" = 0")
    try {
        let p = parseProgram(cangjieLex(sb.toString()))
        println("UNEXPECTED-OK decls=${p.decls.size}")
    } catch (e: ParseASTException) {
        println("typed-exception: ${e.message}")
    }
    0
}

// ASSERT: scan typed-exception
// ASSERT: scan nests too deeply to decode
// ASSERT: scan-not UNEXPECTED-OK
