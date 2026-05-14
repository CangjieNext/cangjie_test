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

// BinaryExpression: LShift, RShift, BitAnd, BitOr, BitXor

main() {
    let pkg = Package("pkg.ser7", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let fn1 = pkg.addFunction(FuncType.get([i32, i32], i32), "fn1", "fn1", "pkg.ser7")
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock
    let lhs = fn1.parameters[0]
    let rhs = fn1.parameters[1]

    let lsh = BinaryExpression.create(BinaryExprKind.LShift, lhs, rhs)
    lsh.overflow = OverflowStrategy.Wrapping
    bb.appendExpr(lsh)

    let rsh = BinaryExpression.create(BinaryExprKind.RShift, lsh.result, rhs)
    rsh.overflow = OverflowStrategy.Wrapping
    bb.appendExpr(rsh)

    let band = BinaryExpression.create(BinaryExprKind.BitAnd, rsh.result, rhs)
    bb.appendExpr(band)

    let bor = BinaryExpression.create(BinaryExprKind.BitOr, band.result, rhs)
    bb.appendExpr(bor)

    let bxor = BinaryExpression.create(BinaryExprKind.BitXor, bor.result, rhs)
    bb.appendExpr(bxor)

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
