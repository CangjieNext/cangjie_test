/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Package.addFunction + Function.initParametersAndBody：双 i32 形参，函数体为 Add 二元表达式（Parameter 作操作数）

/* SCAN
fn params: 2
param0 i32: true
block exprs: 1
add ret i32: true
add kind Add: true
*/

import stdx.chir.*

main() {
    let pkgName = "pkg.chir.fn.adddemo"
    let pkg = Package(pkgName, AccessLevel.Public)
    let i32 = IntType.getInt32()
    let ft = FuncType.get(Array<Type>(2, { _ => i32 }), i32)
    let fn = pkg.addFunction(ft, "addTwo", "addTwo", pkgName)
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let addExpr = BinaryExpression.create(BinaryExprKind.Add, fn.parameters[0], fn.parameters[1])
    bb.appendExpr(addExpr)

    println("fn params: ${fn.parameters.size}")
    println("param0 i32: ${fn.parameters[0].ty == i32}")
    println("block exprs: ${bb.exprs.size}")
    println("add ret i32: ${addExpr.result.ty == i32}")
    println("add kind Add: ${addExpr.toString().contains("Add")}")
}
