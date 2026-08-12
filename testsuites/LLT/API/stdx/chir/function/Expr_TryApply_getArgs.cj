/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// TryApply.getArgs、Apply objType 与 instTypeArgs toString

/* SCAN
tryapply getArgs: 1
apply inst types: 1
refEq tryapply: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.ta", AccessLevel.Public)
    let cls = pkg.addClass("mObj", "Obj", true)
    let callee = pkg.addFunction(FuncType.get([i32], i32), "callee", "callee", "pkg.ta")
    callee.initBody()

    let arg = Constant.create(IntLiteral.get(i32, 4u64)).result
    let fcc = FuncCallContext([arg], [i32], Some(cls.classType))

    let normalFn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "normal", "normal", "pkg.ta")
    let errorFn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "error", "error", "pkg.ta")
    normalFn.initBody()
    errorFn.initBody()
    let normalBb = normalFn.body.getOrThrow().entryBlock
    let errorBb = errorFn.body.getOrThrow().entryBlock

    let ta = TryApply.create(callee, fcc, normalBb, errorBb)

    let host = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "host", "host", "pkg.ta")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock
    let ap = Apply.create(callee, fcc)
    bb.appendExpr(ap)

    println("tryapply getArgs: ${ta.getArgs().size}")
    println("apply inst types: ${ap.instantiatedTypeArgs.size}")
    println("refEq tryapply: ${ta == ta}")
}
