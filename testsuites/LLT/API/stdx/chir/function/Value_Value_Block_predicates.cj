/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Value：identifier / ty / is* / hashCode；Block：exprs / insertExpr / topLevelFunc

/* SCAN
literal flags: true true true
block exprs after insert: 2
top func id has vblk: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let lit = IntLiteral.get(i32, 7u64)
    println("literal flags: ${lit.isLiteral()} ${lit.isLiteral()} ${!lit.isParameter()}")

    let pkg = Package("pkg.vblk", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "vblk", "vblk", "pkg.vblk")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let c0 = Constant.create(lit)
    bb.appendExpr(c0)
    let c1 = Constant.create(BoolLiteral.get(false))
    bb.insertExpr(c1, 0)
    println("block exprs after insert: ${bb.exprs.size}")
    println("top func id has vblk: ${bb.topLevelFunc.identifier.contains("vblk")}")
}
