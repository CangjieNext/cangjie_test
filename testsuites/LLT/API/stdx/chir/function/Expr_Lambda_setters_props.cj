/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Lambda：isLocalFunc / isCompileTimeValue / returnValue 替换 / paramDftValHostFunc

/* SCAN
lambda setters: true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let unit = UnitType.get()
    let pkg = Package("pkg.lam.set", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get([i32], unit), "host", "host", "pkg.lam.set")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let lam = Lambda.create(FuncType.get([i32], i32), "Lam", "Lam", ArrayList<GenericType>())
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    let a0 = Allocate.create(i32)
    lam.body.entryBlock.appendExpr(a0)
    lam.returnValue = a0.result
    let a1 = Allocate.create(i32)
    lam.body.entryBlock.appendExpr(a1)
    lam.returnValue = a1.result
    lam.body.entryBlock.appendExpr(Exit.create())
    lam.isLocalFunc = true
    lam.isCompileTimeValue = true

    let hostLam = Lambda.create(FuncType.get(Array<Type>(), unit), "HostLam", "HostLam", ArrayList<GenericType>())
    bb.appendExpr(hostLam)
    hostLam.initBody()
    hostLam.body.entryBlock.appendExpr(Exit.create())
    lam.paramDftValHostFunc = hostLam

    println("lambda setters: ${lam.isLocalFunc && lam.isCompileTimeValue} ${lam.returnValue == a1.result} ${lam.toString().contains("paramDftValHostFunc")}")
    bb.appendExpr(Exit.create())
}
