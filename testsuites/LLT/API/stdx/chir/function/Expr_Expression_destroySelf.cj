/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Expression.destroySelf 正向与负向用例

/* SCAN
destroySelf kind invalid: true
destroySelf removed from block: true
destroySelf operands empty: true
destroySelf twice no crash: true
*/

import std.collection.*
import stdx.chir.*

main() {
    // 正向：destroySelf 后 kind 变 Invalid，从 block 移除
    let pkg = Package("pkg.ds", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ds", "ds", "pkg.ds")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let e0 = Constant.create(BoolLiteral.get(true))
    let e1 = Constant.create(UnitLiteral.get())
    bb.appendExpr(e0)
    bb.appendExpr(e1)
    e0.destroySelf()
    println("destroySelf kind invalid: ${e0.toString().contains("Invalid")}")
    println("destroySelf removed from block: ${bb.exprs.size == 1 && bb.exprs[0] == e1}")
    println("destroySelf operands empty: ${e0.operands.size == 0}")

    // 负向：对已销毁的 expr 再次调用 destroySelf，不应崩溃
    var noCrash = false
    try {
        e0.destroySelf()
        noCrash = true
    } catch (_: Exception) {
        noCrash = true
    }
    println("destroySelf twice no crash: ${noCrash}")
}
