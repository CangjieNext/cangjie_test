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

// Lambda 带多个泛型参数 T, U；宿主函数也带泛型参数；lambda 体内使用 BinaryExpression 和 Branch

main() {
    let pkg = Package("pkg.ser23", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let boolTy = BoolType.get()

    // 宿主函数带泛型参数 T
    let gT = GenericType.get("pkg.ser23.T", "T")
    let gU = GenericType.get("pkg.ser23.U", "U")
    let fn1 = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fn1", "fn1", "pkg.ser23")
    fn1.genericTypeParams = [gT]
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock
    let p = fn1.parameters[0]

    // Lambda 带泛型参数 T, U
    let lamGenParams = ArrayList<GenericType>()
    lamGenParams.add(gT)
    lamGenParams.add(gU)
    let lam = Lambda.create(
        FuncType.get([i32, boolTy], i32),
        "Lam23",
        "Lam23",
        lamGenParams
    )
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    
    // lambda 体内：Branch on bool param -> trueBlock / falseBlock
    let lamBg = lam.body
    // set return value
    let alloc = Allocate.create(i32)
    lamBg.entryBlock.appendExpr(alloc)
    lam.returnValue = alloc.result
    let lp0 = lam.parameters[0]
    let lp1 = lam.parameters[1]
    let trueBlock = lamBg.appendBlock()
    let falseBlock = lamBg.appendBlock()
    lamBg.entryBlock.appendExpr(Branch.create(lp1, trueBlock, falseBlock))

    let neg = UnaryExpression.create(UnaryExprKind.Neg, lp0)
    trueBlock.appendExpr(neg)
    trueBlock.appendExpr(Exit.create())

    let mul = BinaryExpression.create(BinaryExprKind.Mul, lp0, lp0)
    falseBlock.appendExpr(mul)
    falseBlock.appendExpr(Exit.create())

    // 宿主函数体内使用 lambda 和参数
    let nc = NumericCast.create(p, IntType.getInt64(), OverflowStrategy.Wrapping)
    bb.appendExpr(nc)
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
