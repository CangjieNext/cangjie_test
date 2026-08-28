/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Expression.replaceOperand：operand == other 时直接返回

/* SCAN
replaceOperand noop: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.rop", AccessLevel.Public)
    let callee = pkg.addFunction(FuncType.get([i32], i32), "callee", "callee", "pkg.rop")
    callee.initBody()
    callee.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    let host = pkg.addFunction(FuncType.get([i32], UnitType.get()), "host", "host", "pkg.rop")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock
    let arg = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(arg)
    let ap = Apply.create(callee, FuncCallContext([arg.result], Array<Type>(), None))
    bb.appendExpr(ap)
    ap.replaceOperand(arg.result, arg.result)
    println("replaceOperand noop: ${ap.getArgs()[0] == arg.result}")
    bb.appendExpr(Exit.create())
}
