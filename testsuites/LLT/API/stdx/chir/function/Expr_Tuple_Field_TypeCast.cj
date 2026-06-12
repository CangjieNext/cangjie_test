/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Tuple、Field、Box、StaticCast、UnboxToRef、UnboxToValue（TypeCast 属性）

/* SCAN
tuple field: true
cast props: true
static src: true
*/

import std.collection.*
import stdx.chir.*
import stdx.chir.Box as BoxExpr

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.tf", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "tf", "tf", "pkg.tf")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let a = Constant.create(IntLiteral.get(i32, 1u64)).result
    let b = Constant.create(IntLiteral.get(i32, 2u64)).result
    let els = ArrayList<Value>()
    els.add(a)
    els.add(b)
    let tup = Tuple.create(els)
    bb.appendExpr(tup)
    let path = ArrayList<UInt64>()
    path.add(0u64)
    let fd = Field.create(tup.result, path)
    bb.appendExpr(fd)
    println("tuple field: ${tup.elements.size == 2 && fd.path[0] == 0u64}")

    let bx = BoxExpr.create(a, RefType.get(i32))
    let sc = StaticCast.create(a, IntType.getInt64())
    let ur = UnboxToRef.create(a, RefType.get(i32))
    let uv = UnboxToValue.create(a, i32)
    bb.appendExpr(bx)
    println("cast props: ${bx.targetType == bx.result.ty && bx.sourceType == i32}")
    println("static src: ${sc.srcValue == a && ur.targetType == RefType.get(i32) && uv.targetType == i32}")
}
