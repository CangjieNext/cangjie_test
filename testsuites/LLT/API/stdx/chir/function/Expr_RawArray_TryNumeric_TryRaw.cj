/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// RawArrayAllocate/Init/LiteralInit、TryRawArrayAllocate、TryNumericCast

/* SCAN
raw elem: true
trynum branches: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let sz = Constant.create(IntLiteral.get(IntType.getInt32(), 4u64)).result
    let pkg = Package("pkg.ra", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ra", "ra", "pkg.ra")
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock
    let ra = RawArrayAllocate.create(i32, sz)
    bb.appendExpr(ra)
    let mem = ra.result
    let riv = RawArrayInitByValue.create(mem, sz, Constant.create(IntLiteral.get(i32, 0u64)).result)
    bb.appendExpr(riv)
    let els = ArrayList<Value>()
    els.add(Constant.create(IntLiteral.get(i32, 1u64)).result)
    els.add(Constant.create(IntLiteral.get(i32, 2u64)).result)
    bb.appendExpr(RawArrayLiteralInit.create(mem, els))
    println("raw elem: ${ra.elementType == i32}")

    let bn = bg.appendBlock()
    let be = bg.appendBlock()
    let tra = TryRawArrayAllocate.create(i32, sz, bn, be)
    bb.appendExpr(tra)
    let tnc = TryNumericCast.create(Constant.create(IntLiteral.get(i32, 1u64)).result, IntType.getInt64(), bn, be)
    bb.appendExpr(tnc)
    println("trynum branches: ${tnc.normalBranch == bn && tra.errorBranch == be}")
}
