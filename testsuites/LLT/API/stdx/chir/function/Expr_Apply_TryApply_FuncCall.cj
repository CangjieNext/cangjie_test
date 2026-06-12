/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Apply、TryApply 与 FuncCall / ApplyBase 公开属性

/* SCAN
apply callee ret: true
tryapply branches: true
getArgs len: 1
%2: Int32 = Apply(@g, %1)
: Int32 = TryApply(@g, %1, normal: #0, exception: #0)
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.ap", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "g", "g", "pkg.ap")
    fn.initBody()
    let expr = Constant.create(IntLiteral.get(i32, 5u64))
    let entryBlock = fn.body.getOrThrow().entryBlock
    entryBlock.appendExpr(expr)
    let arg = expr.result
    let fcc = FuncCallContext([arg], Array<Type>(), None)
    let ap = Apply.create(fn, fcc)
    entryBlock.appendExpr(ap)
    println("apply callee ret: ${ap.callee == fn && ap.result.ty == i32}")

    let bn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "bn", "bn", "pkg.ap")
    let be = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "be", "be", "pkg.ap")
    bn.initBody()
    be.initBody()
    let ta = TryApply.create(fn, fcc, bn.body.getOrThrow().entryBlock, be.body.getOrThrow().entryBlock)
    println("tryapply branches: ${ta.normalBranch == bn.body.getOrThrow().entryBlock && ta.errorBranch == be.body.getOrThrow().entryBlock}")
    println("getArgs len: ${ap.getArgs().size}")
    println(ap.toString())
    println(ta.toString())
}
