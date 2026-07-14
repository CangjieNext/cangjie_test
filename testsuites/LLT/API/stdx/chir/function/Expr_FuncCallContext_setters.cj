/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// FuncCallContext.setArg / setInstTypeArg

/* SCAN
setArg value: true
setInstTypeArg ty: Int32
apply args after set: 1
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.fccset", AccessLevel.Public)
    let callee = pkg.addFunction(FuncType.get([i32], i32), "callee", "callee", "pkg.fccset")
    callee.initBody()

    let a0 = Constant.create(IntLiteral.get(i32, 0u64)).result
    let a1 = Constant.create(IntLiteral.get(i32, 9u64)).result
    let fcc = FuncCallContext([a0], [i32], None)
    fcc.setArg(0, a1)
    fcc.setInstTypeArg(0, i32)
    println("setArg value: ${fcc.args[0].toString().contains("9")}")
    println("setInstTypeArg ty: ${fcc.instTypeArgs[0].toString()}")

    let host = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "host", "host", "pkg.fccset")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock
    let ap = Apply.create(callee, fcc)
    bb.appendExpr(ap)
    println("apply args after set: ${ap.getArgs().size}")
}
