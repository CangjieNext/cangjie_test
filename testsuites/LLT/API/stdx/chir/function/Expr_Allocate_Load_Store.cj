/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Allocate、Load（Ref）、Store 的创建与属性

/* SCAN
alloc ref: true
load ty i32: true
store ops: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let pkgName = "pkg.chir.gsym"
    let pkg = Package(pkgName, AccessLevel.Public)
    let ft = FuncType.get(Array<Type>(1, { _ => IntType.getInt32() }), BoolType.get())
    let fn = pkg.addFunction(ft, "foo", "bar", pkgName)
    fn.initBody()

    let bb = fn.body.getOrThrow().entryBlock
    let i32 = IntType.getInt32()
    let a = Allocate.create(i32)
    bb.appendExpr(a)
    let ld = Load.create(a.result)
    bb.appendExpr(ld)
    let st = Store.create(ld.result, a.result)
    bb.appendExpr(st)
    println("alloc ref: ${a.result.ty.isRefType() && a.allocatedType == i32}")
    println("load ty i32: ${ld.result.ty == i32}")
    println("store ops: ${st.srcValue == ld.result && st.dstAddress == a.result}")
}
