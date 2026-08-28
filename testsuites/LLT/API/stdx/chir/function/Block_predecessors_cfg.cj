/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Block.predecessors：append/insert terminator、MultiBranch、TryBinary、CHIRBuilder 建边

/* SCAN
append GoTo pred: true
insert Branch preds: true
MultiBranch preds: true
TryBinary preds: true
builder GoTo pred: true
*/

import std.collection.*
import stdx.chir.*

func containsPred(bb: Block, pred: Block): Bool {
    for (p in bb.predecessors) {
        if (p == pred) {
            return true
        }
    }
    return false
}

main() {
    let u = UnitType.get()
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.pred.build", AccessLevel.Public)

    // appendExpr(GoTo)：后继应登记前驱
    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), u), "g1", "g1", "pkg.pred.build")
    fn1.initBody()
    let g1 = fn1.body.getOrThrow()
    let entry1 = g1.entryBlock
    let t1 = g1.appendBlock()
    entry1.appendExpr(GoTo.create(t1))
    println("append GoTo pred: ${containsPred(t1, entry1) && t1.predecessors.size == 1}")

    // insertExpr(Branch)：true/false 目标都应登记
    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), u), "b1", "b1", "pkg.pred.build")
    fn2.initBody()
    let g2 = fn2.body.getOrThrow()
    let entry2 = g2.entryBlock
    let tb = g2.appendBlock()
    let fb = g2.appendBlock()
    let cond = Constant.create(BoolLiteral.get(true))
    entry2.appendExpr(cond)
    entry2.insertExpr(Branch.create(cond.result, tb, fb), entry2.exprs.size)
    println("insert Branch preds: ${containsPred(tb, entry2) && containsPred(fb, entry2)}")

    // MultiBranch：default + case targets
    let fn3 = pkg.addFunction(FuncType.get(Array<Type>(), u), "m1", "m1", "pkg.pred.build")
    fn3.initBody()
    let g3 = fn3.body.getOrThrow()
    let entry3 = g3.entryBlock
    let defb = g3.appendBlock()
    let c0 = g3.appendBlock()
    let c1 = g3.appendBlock()
    let sel = Constant.create(IntLiteral.get(i32, 0u64))
    entry3.appendExpr(sel)
    let targets = ArrayList<Block>()
    targets.add(c0)
    targets.add(c1)
    let cases = ArrayList<UInt64>()
    cases.add(0u64)
    cases.add(1u64)
    entry3.appendExpr(MultiBranch.create(sel.result, defb, targets, cases))
    println("MultiBranch preds: ${containsPred(defb, entry3) && containsPred(c0, entry3) && containsPred(c1, entry3)}")

    // TryBinary：normal / error 分支
    let fn4 = pkg.addFunction(FuncType.get(Array<Type>(), u), "t1", "t1", "pkg.pred.build")
    fn4.initBody()
    let g4 = fn4.body.getOrThrow()
    let entry4 = g4.entryBlock
    let normal = g4.appendBlock()
    let err = g4.appendBlock()
    let b4 = CHIRBuilder(entry4)
    let v1 = b4.createConstant(IntLiteral.get(i32, 1u64)).result
    let v2 = b4.createConstant(IntLiteral.get(i32, 2u64)).result
    b4.createTryBinaryAdd(v1, v2, normal, err)
    println("TryBinary preds: ${containsPred(normal, entry4) && containsPred(err, entry4)}")

    // CHIRBuilder.createGoTo 走 insertExpr 路径
    let fn5 = pkg.addFunction(FuncType.get(Array<Type>(), u), "cb", "cb", "pkg.pred.build")
    fn5.initBody()
    let g5 = fn5.body.getOrThrow()
    let entry5 = g5.entryBlock
    let t5 = g5.appendBlock()
    CHIRBuilder(entry5).createGoTo(t5)
    println("builder GoTo pred: ${containsPred(t5, entry5)}")
}
