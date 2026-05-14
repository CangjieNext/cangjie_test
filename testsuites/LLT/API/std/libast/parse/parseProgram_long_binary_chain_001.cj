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

// Positive case: a long left-associative binary chain `0 + 1 + 2 + ... + N`
// is legal Cangjie. The parser builds it iteratively via precedence climbing,
// so the parser itself does not recurse — but the resulting AST is N levels
// of left-spined BinaryExpr nodes. AST::Walker::Walk and
// NodeWriter::SerializeBinaryExpr (C++) plus std.ast::createBinaryExpr
// (Cangjie deserializer) used to recurse once per level on
// `leftExpr`, which exhausted the Cangjie coroutine stack inside
// libcangjie-std-ast on inputs with thousands of operands (see UsersForum
// issue 3128: parameters_arguments_in_one_func.cj reproducer).
//
// All three are now iterative, so parsing a 1000-deep chain must succeed
// with one top-level decl in the resulting Program.
main() {
    var code = "main() { let x = 0"
    let n = 1000
    for (i in 1..n) {
        code = code + " + ${i}"
    }
    code = code + "; 0 }"
    let p = parseProgram(cangjieLex(code))
    println("decls=${p.decls.size}")
    0
}

// ASSERT: scan decls=1
