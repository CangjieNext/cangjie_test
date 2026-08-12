/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// GlobalValue.destroySelf：GlobalVar 清空 initializer，并销毁函数型 initializer

/* SCAN
gv literal init cleared: true
gv invalid after literal: true
gv init func cleared: true
init func invalid: true
init func body cleared: true
pkg gv count unchanged: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.gv.ds"
    let pkg = Package(pkgName, AccessLevel.Public)
    let i32 = IntType.getInt32()

    let gvLit = pkg.addGlobalVar(i32, "g_lit", "gLit", pkgName)
    gvLit.setInitializer(IntLiteral.get(i32, 7u64))
    gvLit.destroySelf()
    println("gv literal init cleared: ${gvLit.initializer.isNone()}")
    println("gv invalid after literal: ${!gvLit.isGlobalVar()}")

    let gvFn = pkg.addGlobalVar(i32, "g_fn", "gFn", pkgName)
    let initFn = pkg.addFunction(FuncType.get(Array<Type>(), i32), "g_fn.init", "init", pkgName)
    initFn.initBody()
    initFn.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    gvFn.setInitializer(initFn)
    gvFn.destroySelf()
    println("gv init func cleared: ${gvFn.initializer.isNone()}")
    println("init func invalid: ${!initFn.isFunction()}")
    println("init func body cleared: ${initFn.body.isNone()}")
    println("pkg gv count unchanged: ${pkg.globalVars.size == 2}")
}
