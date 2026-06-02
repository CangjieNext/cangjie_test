/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Lambda.create 构建 ()->Unit：入口块中先 Unit 字面量常量，再以 Exit 终止（expression + LiteralValue 工厂）

/* SCAN
lambda params: 0
body expr count: 2
first is Constant: true
last is terminator: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let ft = FuncType.get(Array<Type>(), UnitType.get())
    let pkg = Package("pkg.lud", AccessLevel.Public)
    let fn = pkg.addFunction(ft, "lambdaUnitDemo", "unitDemo", "pkg.lud")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let unitConst = Constant.create(UnitLiteral.get())
    bb.appendExpr(unitConst)

    let ex = Exit.create()
    bb.appendExpr(ex)

    println("lambda params: ${fn.parameters.size}")
    println("body expr count: ${bb.exprs.size}")
    println("first is Constant: ${bb.exprs[0].toString().contains("Constant")}")
    println("last is terminator: ${bb.exprs[bb.exprs.size - 1].isTerminator()}")
}
