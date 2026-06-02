/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
init parent: true
insert pos: true true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.call", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "f", "f", "pkg.cb.call")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let b0 = CHIRBuilder(bb)
    let c0 = b0.createConstant(IntLiteral.get(IntType.getInt32(), 1u64))
    println("init parent: ${c0.owner == bb}")

    let atStart = CHIRBuilder(AtStart(bb))
    let cs = atStart.createConstant(IntLiteral.get(IntType.getInt32(), 2u64))
    let atEnd = CHIRBuilder(AtEnd(bb))
    let ce = atEnd.createConstant(IntLiteral.get(IntType.getInt32(), 3u64))
    let before = CHIRBuilder(Before(ce))
    let cb = before.createConstant(IntLiteral.get(IntType.getInt32(), 4u64))
    let after = CHIRBuilder(After(cs))
    let ca = after.createConstant(IntLiteral.get(IntType.getInt32(), 5u64))

    println("insert pos: ${bb.exprs[0] == cs} ${bb.exprs[1] == ca} ${bb.exprs[bb.exprs.size - 2] == cb} ${bb.exprs[bb.exprs.size - 1] == ce}")
}
