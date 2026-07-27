/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// createInout / createTryInout

/* SCAN
inout: true true true
try inout: true true true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.intrinsic", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "intr", "intr", "pkg.cb.intrinsic")
    fn.initBody()
    let body = fn.body.getOrThrow()
    let bb = body.entryBlock
    let bn = body.appendBlock()
    let be = body.appendBlock()
    let b = CHIRBuilder(bb)

    let param = b.createAllocate(i32).result
    let retTy = RefType.get(i32)
    let ioExpr = b.createInout(retTy, param)
    println("inout: ${ioExpr.getArgs().size == 1} ${ioExpr.getArgs()[0] == param} ${ioExpr.result.ty == retTy}")

    let tryIoExpr = b.createTryInout(retTy, param, bn, be)
    println("try inout: ${tryIoExpr.getArgs().size == 1} ${tryIoExpr.getArgs()[0] == param} ${tryIoExpr.normalBranch == bn && tryIoExpr.errorBranch == be}")
}
