/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Invoke / TryInvoke：objType dump 与 getArgs / branches

/* SCAN
invoke objType: true
tryinvoke args: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let unit = UnitType.get()
    let pkg = Package("pkg.inv.obj", AccessLevel.Public)
    let methodFn = pkg.addFunction(FuncType.get([i32], unit), "m", "m", "pkg.inv.obj")
    let host = pkg.addFunction(FuncType.get([i32], unit), "host", "host", "pkg.inv.obj")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock
    let arg = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(arg)
    let gs = GetRTTIStatic.create(i32)
    bb.appendExpr(gs)
    let inv = Invoke.create(unit, InvokeCallContext(gs.result, FuncCallContext([arg.result], Array<Type>(), Some(i32)), methodFn))
    bb.appendExpr(inv)
    println("invoke objType: ${inv.toString().contains("Int32->")}")

    let tiFn = pkg.addFunction(FuncType.get([i32], unit), "ti", "ti", "pkg.inv.obj")
    tiFn.initBody()
    let tiBg = tiFn.body.getOrThrow()
    let tiN = tiBg.appendBlock()
    let tiE = tiBg.appendBlock()
    let gs2 = GetRTTIStatic.create(i32)
    tiBg.entryBlock.appendExpr(gs2)
    let ti = TryInvoke.create(i32, InvokeCallContext(gs2.result,
        FuncCallContext([tiFn.parameters[0]], Array<Type>(), Some(i32)), methodFn), tiN, tiE)
    tiBg.entryBlock.appendExpr(ti)
    tiN.appendExpr(Exit.create())
    tiE.appendExpr(Exit.create())
    println("tryinvoke args: ${ti.getArgs().size >= 1 && ti.errorBranch == tiE && ti.normalBranch == tiN}")
    bb.appendExpr(Exit.create())
}
