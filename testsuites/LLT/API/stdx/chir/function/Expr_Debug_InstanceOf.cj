/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Debug、InstanceOf

/* SCAN
debug src: probe
instof bool: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkg = Package("pkg.di", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "di", "di", "pkg.di")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let loc = Constant.create(IntLiteral.get(IntType.getInt32(), 0u64)).result
    let d = Debug.create(loc, "probe")
    bb.appendExpr(d)
    let io = InstanceOf.create(loc, IntType.getInt32())
    bb.appendExpr(io)
    println("debug src: ${d.srcCodeName}")
    println("instof bool: ${io.result.ty == BoolType.get()}")
}
