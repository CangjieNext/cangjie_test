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

// CastToConcrete, CastToGeneric, multiple functions with multiple params

main() {
    let pkg = Package("pkg.ser21", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    // fn1: CastToConcrete, CastToGeneric
    let fn1 = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fn1", "fn1", "pkg.ser21")
    fn1.initBody()
    let bb1 = fn1.body.getOrThrow().entryBlock
    let p1 = fn1.parameters[0]

    let ctc = CastToConcrete.create(p1, i64)
    bb1.appendExpr(ctc)

    let g = GenericType.get("T", "T1")
    let ctg = CastToGeneric.create(p1, g)
    bb1.appendExpr(ctg)

    bb1.appendExpr(Exit.create())

    // fn2: multiple params, mix of binary + unary + terminators
    let fn2 = pkg.addFunction(FuncType.get([i32, i32, BoolType.get()], UnitType.get()), "fn2", "fn2", "pkg.ser21")
    fn2.initBody()
    let bg2 = fn2.body.getOrThrow()
    let entry2 = bg2.entryBlock
    let a = fn2.parameters[0]
    let b = fn2.parameters[1]
    let cond = fn2.parameters[2]

    let add = BinaryExpression.create(BinaryExprKind.Add, a, b)
    entry2.appendExpr(add)
    let neg = UnaryExpression.create(UnaryExprKind.Neg, add.result)
    entry2.appendExpr(neg)

    let trueBlock = bg2.appendBlock()
    let falseBlock = bg2.appendBlock()
    entry2.appendExpr(Branch.create(cond, trueBlock, falseBlock))

    let mul = BinaryExpression.create(BinaryExprKind.Mul, a, b)
    trueBlock.appendExpr(mul)
    trueBlock.appendExpr(Exit.create())
    falseBlock.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
