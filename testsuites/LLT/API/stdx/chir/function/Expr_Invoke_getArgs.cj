/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Invoke.getArgs、TryInvoke.getArgs

/* SCAN
invoke getArgs: 1
invoke refEq: true
tryinvoke getArgs: 1
tryinvoke refEq: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.ivga", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ivga", "ivga", "pkg.ivga")
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock

    let caller = GetRTTIStatic.create(i32)
    bb.appendExpr(caller)
    let arg = Constant.create(IntLiteral.get(i32, 8u64)).result
    let mty = FuncType.get([i32], UnitType.get())
    let vir = FuncSigInfo("bar", mty, Array<GenericType>())
    let ic = InvokeCallContext(caller.result, vir, FuncCallContext([arg], Array<Type>(), None))
    let inv = Invoke.create(UnitType.get(), ic)
    bb.appendExpr(inv)
    println("invoke getArgs: ${inv.getArgs().size}")
    println("invoke refEq: ${inv == inv}")

    let normalBb = bg.appendBlock()
    let errorBb = bg.appendBlock()
    let ti = TryInvoke.create(i32, ic, normalBb, errorBb)
    bb.appendExpr(ti)
    println("tryinvoke getArgs: ${ti.getArgs().size}")
    println("tryinvoke refEq: ${ti == ti}")
}
