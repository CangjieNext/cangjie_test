/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import std.collection.*
import stdx.chir.*

// Lambda 带泛型参数：单泛型参数 T，lambda 体内使用 UnaryExpression 和 BinaryExpression

main() {
    let pkg = Package("pkg.ser22", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn1", "fn1", "pkg.ser22")
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock

    // Lambda 带泛型参数 T
    let gT = GenericType.get("pkg.ser22.T", "T")
    let lamGenParams = ArrayList<GenericType>()
    lamGenParams.add(gT)
    let lam = Lambda.create(
        FuncType.get([i32, i32], i32),
        "Lam22",
        "Lam22",
        lamGenParams
    )
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()

    // lambda 体内：BinaryExpression Add 使用 lambda 参数
    let lamBb = lam.body.entryBlock
    // set return value
    let alloc = Allocate.create(i32)
    lamBb.appendExpr(alloc)
    lam.returnValue = alloc.result
    let lp0 = lam.parameters[0]
    let lp1 = lam.parameters[1]
    let add = BinaryExpression.create(BinaryExprKind.Add, lp0, lp1)
    lamBb.appendExpr(add)
    let neg = UnaryExpression.create(UnaryExprKind.Neg, add.result)
    lamBb.appendExpr(neg)
    lamBb.appendExpr(Exit.create())

    bb.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
