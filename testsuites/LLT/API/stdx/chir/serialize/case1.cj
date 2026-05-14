/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import stdx.chir.*

main() {
    // 创建 package
    let pkg = Package("pkg.example", AccessLevel.Public)

    // 创建函数类型 (Bool) -> Int64
    let boolTy = BoolType.get()
    let i64 = IntType.getInt64()
    let funcTy = FuncType.get([boolTy], i64)

    // 在 package 中添加全局函数
    let fn = pkg.addFunction(funcTy, "exampleFunc", "exampleFunc", "pkg.example")
    fn.initBody()

    let bg = fn.body.getOrThrow()
    let entryBb = bg.entryBlock
    let normalBb = bg.appendBlock()
    let errorBb = bg.appendBlock()

    // 获取函数参数 (Bool 类型)
    let param = fn.parameters[0]

    // set return value
    let alloc = Allocate.create(i64)
    entryBb.appendExpr(alloc)
    fn.returnValue = alloc.result
    // UnaryExpression: Not(param) -> Bool
    let unaryExpr = UnaryExpression.create(UnaryExprKind.Not, param)
    entryBb.appendExpr(unaryExpr)

    // BinaryExpression: Equal(param, unaryExpr.result) -> Bool
    let binaryExpr = BinaryExpression.create(BinaryExprKind.Equal, param, unaryExpr.result)
    entryBb.appendExpr(binaryExpr)

    // TryUnaryExpression: TryNeg(param) with normal/error branches
    // 注意：TryUnaryExpression 操作数类型需与 op 类型一致，这里用 i64 常量作为操作数
    let i64Const = Constant.create(IntLiteral.get(i64, 1u64))
    entryBb.appendExpr(i64Const)
    let normalBb2 = bg.appendBlock()
    let errorBb2 = bg.appendBlock()
    let tryUnaryExpr = TryUnaryExpression.create(i64Const.result, normalBb2, errorBb2)
    entryBb.appendExpr(tryUnaryExpr)

    // TryBinaryExpression: TryAdd(i64Const.result, i64Const.result) with normal/error branches
    let i64Const2 = Constant.create(IntLiteral.get(i64, 2u64))
    normalBb2.appendExpr(i64Const2)
    let tryBinaryExpr = TryBinaryExpression.create(BinaryExprKind.Add, i64Const.result, i64Const2.result, normalBb, errorBb)
    normalBb2.appendExpr(tryBinaryExpr)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
