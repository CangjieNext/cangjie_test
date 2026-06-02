/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Value.users（字面量被 Constant 引用后）

/* SCAN
const uses lit: true users: 1
*/

import std.collection.*
import stdx.chir.*

main() {
    let lit = BoolLiteral.get(true)
    let pkg = Package("pkg.vu", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "vu", "vu", "pkg.vu")
    fn.initBody()
    let c = Constant.create(lit)
    fn.body.getOrThrow().entryBlock.appendExpr(c)
    println("const uses lit: ${c.operands[0] == lit} users: ${lit.users.size}")
}
