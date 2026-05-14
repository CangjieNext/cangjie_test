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

// BinaryExpression: LT, GT, LE, GE, Equal, NotEqual, And, Or
// fn1 带泛型参数 T, fn2 带泛型参数 U

main() {
    let pkg = Package("pkg.ser8", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let boolTy = BoolType.get()

    let gT = GenericType.get("pkg.ser8.T", "T")
    // fn1: (Int32, Int32) -> Bool, comparison operators, generic T
    let fn1 = pkg.addFunction(FuncType.get([i32, i32], boolTy), "fn1", "fn1", "pkg.ser8")
    fn1.genericTypeParams = [gT]
    fn1.initBody()
    let bb1 = fn1.body.getOrThrow().entryBlock
    let lhs = fn1.parameters[0]
    let rhs = fn1.parameters[1]

    let lt = BinaryExpression.create(BinaryExprKind.LT, lhs, rhs)
    bb1.appendExpr(lt)
    let gt = BinaryExpression.create(BinaryExprKind.GT, lhs, rhs)
    bb1.appendExpr(gt)
    let le = BinaryExpression.create(BinaryExprKind.LE, lhs, rhs)
    bb1.appendExpr(le)
    let ge = BinaryExpression.create(BinaryExprKind.GE, lhs, rhs)
    bb1.appendExpr(ge)
    let eq = BinaryExpression.create(BinaryExprKind.Equal, lhs, rhs)
    bb1.appendExpr(eq)
    let ne = BinaryExpression.create(BinaryExprKind.NotEqual, lhs, rhs)
    bb1.appendExpr(ne)
    bb1.appendExpr(Exit.create())

    let gU = GenericType.get("pkg.ser8.U", "U")
    // fn2: (Bool, Bool) -> Bool, logical operators, generic U
    let fn2 = pkg.addFunction(FuncType.get([boolTy, boolTy], boolTy), "fn2", "fn2", "pkg.ser8")
    fn2.genericTypeParams = [gU]
    fn2.initBody()
    let bb2 = fn2.body.getOrThrow().entryBlock
    let b1 = fn2.parameters[0]
    let b2 = fn2.parameters[1]
    let andExpr = BinaryExpression.create(BinaryExprKind.And, b1, b2)
    bb2.appendExpr(andExpr)
    let orExpr = BinaryExpression.create(BinaryExprKind.Or, andExpr.result, b2)
    bb2.appendExpr(orExpr)
    bb2.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
