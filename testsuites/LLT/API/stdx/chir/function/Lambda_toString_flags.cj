/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// lambdaToString：[compileTimeVal] / [localFunc]

/* SCAN
has compileTimeVal: true
has localFunc: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.lam.str", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "f", "f", "pkg.lam.str")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let lam1 = Lambda.create(FuncType.get([i32], i32), "L1", "L1", ArrayList<GenericType>())
    lam1.isCompileTimeValue = true
    bb.appendExpr(lam1)
    lam1.initParameters()
    lam1.initBody()
    let a1 = Allocate.create(i32)
    lam1.body.entryBlock.appendExpr(a1)
    lam1.returnValue = a1.result
    lam1.body.entryBlock.appendExpr(Exit.create())
    println("has compileTimeVal: ${lam1.toString().contains("[compileTimeVal]")}")

    let lam2 = Lambda.create(FuncType.get([i32], i32), "L2", "L2", ArrayList<GenericType>())
    lam2.isLocalFunc = true
    bb.appendExpr(lam2)
    lam2.initParameters()
    lam2.initBody()
    let a2 = Allocate.create(i32)
    lam2.body.entryBlock.appendExpr(a2)
    lam2.returnValue = a2.result
    lam2.body.entryBlock.appendExpr(Exit.create())
    println("has localFunc: ${lam2.toString().contains("[localFunc]")}")

    bb.appendExpr(Exit.create())
}
