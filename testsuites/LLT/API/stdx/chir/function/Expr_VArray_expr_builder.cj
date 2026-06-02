/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// VArrayExpr、VArrayBuilder

/* SCAN
varray ty: true
vbuild: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.va", AccessLevel.Public)
    let initf = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "initf", "initf", "pkg.va")
    let els = ArrayList<Value>()
    els.add(Constant.create(IntLiteral.get(i32, 1u64)).result)
    els.add(Constant.create(IntLiteral.get(i32, 2u64)).result)
    let ve = VArrayExpr.create(els)
    let sz = Constant.create(IntLiteral.get(i32, 2u64)).result
    let iv = Constant.create(IntLiteral.get(i32, 0u64)).result
    let vat = VArrayType.get(i32, 2i64)
    let vb = VArrayBuilder.create(vat, sz, iv, initf)
    println("varray ty: ${ve.result.ty.isVArrayType()}")
    println("vbuild: ${vb.result.ty == vat}")
}
