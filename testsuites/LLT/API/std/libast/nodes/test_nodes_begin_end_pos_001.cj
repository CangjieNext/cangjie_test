// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

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

/* SCAN-IN
-----ClassDecl-----
fileID: 1, line: 8, column: 20
fileID: 1, line: 8, column: 39
-----RefExpr-----
fileID: 1, line: 14, column: 29
fileID: 1, line: 14, column: 30
-----JumpExpr-----
fileID: 1, line: 19, column: 31
fileID: 1, line: 19, column: 36
-----TypePattern-----
fileID: 1, line: 24, column: 31
fileID: 1, line: 24, column: 38
-----PrimitiveType-----
fileID: 1, line: 29, column: 33
fileID: 1, line: 29, column: 38
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
