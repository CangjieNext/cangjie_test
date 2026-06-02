/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Package.addFunction / addGlobalVar：标识符带全局前缀，类型与元数据正确

/* SCAN
fn id: @foo
fn src: bar
fn pkg: pkg.chir.gsym
fn retBool: true
fn param0 i32: true
gv id: @g0
gv src: myGlobal
gv pkg: pkg.chir.gsym
gv i64: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.chir.gsym"
    let pkg = Package(pkgName, AccessLevel.Public)
    let ft = FuncType.get(Array<Type>(1, { _ => IntType.getInt32() }), BoolType.get())
    let fn = pkg.addFunction(ft, "foo", "bar", pkgName)
    println("fn id: ${fn.identifier}")
    println("fn src: ${fn.srcCodeName}")
    println("fn pkg: ${fn.packageName}")
    println("fn retBool: ${fn.funcType.returnType == BoolType.get()}")
    println("fn param0 i32: ${fn.funcType.paramTypes[0] == IntType.getInt32()}")

    let gv = pkg.addGlobalVar(IntType.getInt64(), "g0", "myGlobal", pkgName)
    println("gv id: ${gv.identifier}")
    println("gv src: ${gv.srcCodeName}")
    println("gv pkg: ${gv.packageName}")
    println("gv i64: ${gv.ty == IntType.getInt64()}")
}
