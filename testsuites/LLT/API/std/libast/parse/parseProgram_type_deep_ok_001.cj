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

// Deep single-argument generic nesting (`S<S<...<Int64>>>`). The native
// recursive-descent parser used to run on the 128 KB Cangjie coroutine
// stack via the C2N FFI stub and SIGSEGV around depth 250 (UsersForum
// issue 3128, regression_fuzz_0017.cj reproducer). The parse FFI entries
// now run on a dedicated thread whose stack is sized from the token
// count, and std.ast::createRefType decodes single-argument ref_type
// chains iteratively, so a 20000-deep type chain must parse into one
// top-level decl regardless of the coroutine stack size.
main() {
    let depth = 20000
    let sb = StringBuilder()
    sb.append("var x: ")
    for (_ in 0..depth) {
        sb.append("S<")
    }
    sb.append("Int64")
    for (_ in 0..depth) {
        sb.append(">")
    }
    sb.append(" = 0")
    let p = parseProgram(cangjieLex(sb.toString()))
    println("decls=${p.decls.size}")
    0
}

// ASSERT: scan decls=1
