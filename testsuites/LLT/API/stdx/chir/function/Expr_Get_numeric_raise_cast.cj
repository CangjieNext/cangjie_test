/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// GetException、GetRTTI、GetRTTIStatic、GetInstantiateValue、NumericCast、RaiseException

/* SCAN
get ok: true true true
inst ty eq fn: true
cast raise: true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.gk", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "gk", "gk", "pkg.gk")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let v = Constant.create(IntLiteral.get(i32, 2u64)).result
    let ge = GetException.create(i32)
    let gr = GetRTTI.create(v)
    let gs = GetRTTIStatic.create(i32)
    bb.appendExpr(ge)
    bb.appendExpr(gr)
    bb.appendExpr(gs)
    println("get ok: ${ge.result.ty == i32} ${gr.result.ty == UnitType.get()} ${gs.ty == i32}")

    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), i32), "gi", "gi", "pkg.gi")
    let giv = GetInstantiateValue.create(fn2, ArrayList<Type>())
    bb.appendExpr(giv)
    println("inst ty eq fn: ${giv.instantiateTypes.isEmpty() && giv.result.ty == fn2.ty}")

    let nc = NumericCast.create(v, IntType.getInt64(), OverflowStrategy.Wrapping)
    bb.appendExpr(nc)
    let ra = RaiseException.create(v)
    bb.appendExpr(ra)
    println("cast raise: ${nc.overflow == OverflowStrategy.Wrapping} ${ra.result.ty == UnitType.get()}")
}
