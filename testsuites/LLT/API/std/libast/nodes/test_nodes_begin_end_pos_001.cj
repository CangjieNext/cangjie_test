/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    println("-----ClassDecl-----")
    let tk = quote(class A{ let a = 0})
    let cl = ClassDecl(tk)
    cl.beginPos.dump()
    cl.endPos.dump()

    println("-----RefExpr-----")
    let ref = RefExpr(quote(a))
    ref.beginPos.dump()
    ref.endPos.dump()

    println("-----JumpExpr-----")
    let jump = JumpExpr(quote(break))
    jump.beginPos.dump()
    jump.endPos.dump()

    println("-----TypePattern-----")
    let t = TypePattern(quote(b: Base))
    t.beginPos.dump()
    t.endPos.dump()

    println("-----PrimitiveType-----")
    let p = PrimitiveType(quote(Int64))
    p.beginPos.dump()
    p.endPos.dump()
}

// ASSERT: scan -----ClassDecl-----
// ASSERT: scan -----RefExpr-----
// ASSERT: scan -----JumpExpr-----
// ASSERT: scan -----TypePattern-----
// ASSERT: scan -----PrimitiveType-----