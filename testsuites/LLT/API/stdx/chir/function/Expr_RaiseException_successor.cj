/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// RaiseException 双参数重载（带 successor 块）

/* SCAN
raise succ ops: 2
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.rz", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "rz", "rz", "pkg.rz")
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock
    let nx = bg.appendBlock()
    let v = Constant.create(UnitLiteral.get()).result
    let r = RaiseException.create(v, nx)
    bb.appendExpr(r)
    println("raise succ ops: ${r.operands.size}")
}
