/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
insert advance order: true true true
overload regression: true true true
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

    let b = CHIRBuilder(AtStart(bb))
    let c0 = b.createConstant(IntLiteral.get(i32, 0u64))
    let c1 = b.createConstant(IntLiteral.get(i32, 1u64))
    let c2 = b.createConstant(IntLiteral.get(i32, 2u64))
    println("insert advance order: ${bb.exprs[0] == c0} ${bb.exprs[1] == c1} ${bb.exprs[2] == c2}")

    let lv = b.createLambda(FuncType.get(Array<Type>(1, { _ => i32 }), UnitType.get()), "ovL", "ovL").result
    let tsA = b.createTrySpawn(UnitType.get(), lv, bn, be)
    let tsB = b.createTrySpawn(UnitType.get(), lv, c1.result, bn, be)
    let rrA = b.createRaiseException(c1.result)
    let rrB = b.createRaiseException(c1.result, bn)
    println("overload regression: ${tsA.operands.size == 3 && tsB.operands.size == 4} ${rrA.operands.size == 1 && rrB.operands.size == 2} ${tsB.normalBranch == bn && tsB.errorBranch == be}")
}
