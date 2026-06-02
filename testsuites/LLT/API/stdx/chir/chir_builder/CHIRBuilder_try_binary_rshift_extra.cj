/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
try rshift branches: true true
try rshift kind and ty: true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.call", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "f", "f", "pkg.cb.call")
    fn.initBody()
    let body = fn.body.getOrThrow()
    let bb = body.entryBlock
    let bn = body.appendBlock()
    let be = body.appendBlock()
    let b = CHIRBuilder(bb)

    let v1 = b.createConstant(IntLiteral.get(i32, 16u64)).result
    let v2 = b.createConstant(IntLiteral.get(i32, 1u64)).result
    let trs = b.createTryBinaryRShift(v1, v2, bn, be)

    println("try rshift branches: ${trs.normalBranch == bn} ${trs.errorBranch == be}")
    println("try rshift kind and ty: ${trs.toString().contains("RShift")} ${trs.result.ty == i32}")
}
