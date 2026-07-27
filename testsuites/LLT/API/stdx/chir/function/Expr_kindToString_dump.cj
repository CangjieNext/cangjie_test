/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// toString / kindToString：ExprKind 分类辅助与 Intrinsic dump

/* SCAN
dump touch: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let boolTy = BoolType.get()
    let unit = UnitType.get()
    let pkg = Package("pkg.kind.dump", AccessLevel.Public)

    let host = pkg.addFunction(FuncType.get([i32], unit), "host", "host", "pkg.kind.dump")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock
    let c = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(c)
    let v = c.result
    let bin = BinaryExpression.create(BinaryExprKind.Add, v, v)
    bb.appendExpr(bin)
    let un = UnaryExpression.create(UnaryExprKind.Neg, v)
    bb.appendExpr(un)
    let alloc = Allocate.create(i32)
    bb.appendExpr(alloc)
    let io = CHIRBuilder(bb).createInout(RefType.get(i32), alloc.result)

    let brFn = pkg.addFunction(FuncType.get([boolTy], unit), "br", "br", "pkg.kind.dump")
    brFn.initBody()
    let brBg = brFn.body.getOrThrow()
    let bt = brBg.appendBlock()
    let bf = brBg.appendBlock()
    let br = Branch.create(brFn.parameters[0], bt, bf)
    brBg.entryBlock.appendExpr(br)
    bt.appendExpr(Exit.create())
    bf.appendExpr(Exit.create())

    println("dump touch: ${bin.toString().contains("Add") && un.toString().contains("Neg") && br.toString().contains("Branch") && io.toString().contains("Intrinsic")}")
    bb.appendExpr(Exit.create())
}
