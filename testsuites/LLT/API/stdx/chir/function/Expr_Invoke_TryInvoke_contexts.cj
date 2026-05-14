/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Invoke、TryInvoke、VirMethodContext、InvokeCallContext

/* SCAN
invoke name: foo mgp: true
tryinvoke ok: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.iv", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "iv", "iv", "pkg.iv")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let g = GetRTTIStatic.create(i32)
    bb.appendExpr(g)
    let mty = FuncType.get(Array<Type>(1, { _ => i32 }), UnitType.get())
    let vir = FuncSigInfo("foo", mty, Array<GenericType>())
    let ic = InvokeCallContext(g.result, vir, FuncCallContext([Constant.create(IntLiteral.get(i32, 1u64)).result], Array<Type>(), None))
    let inv = Invoke.create(UnitType.get(), ic)
    bb.appendExpr(inv)
    println("invoke name: ${inv.methodName} mgp: ${inv.methodGenericTypeParams.isEmpty()}")

    let bn = fn.body.getOrThrow().appendBlock()
    let be = fn.body.getOrThrow().appendBlock()
    let ti = TryInvoke.create(i32, ic, bn, be)
    bb.appendExpr(ti)
    println("tryinvoke ok: ${ti.methodType == mty && ti.normalBranch == bn}")
}
