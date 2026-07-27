/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Block.predecessors：replaceOperand、destroySelf、moveAfter、同目标去重、共享后继

/* SCAN
replaceOperand retarget: true
destroySelf unlinks: true
moveAfter rehosts: true
dedup same target: true
shared target after one destroy: true
*/

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
    let pkg = Package("pkg.pred.update", AccessLevel.Public)

    // replaceOperand 改 GoTo 目标：旧后继摘边，新后继挂边
    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), u), "r1", "r1", "pkg.pred.update")
    fn1.initBody()
    let g1 = fn1.body.getOrThrow()
    let entry1 = g1.entryBlock
    let oldT = g1.appendBlock()
    let newT = g1.appendBlock()
    let gt1 = GoTo.create(oldT)
    entry1.appendExpr(gt1)
    gt1.replaceOperand(oldT, newT)
    println("replaceOperand retarget: ${!containsPred(oldT, entry1) && containsPred(newT, entry1) && oldT.predecessors.size == 0 && newT.predecessors.size == 1}")

    // destroySelf terminator：从后继 predecessors 移除
    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), u), "d1", "d1", "pkg.pred.update")
    fn2.initBody()
    let g2 = fn2.body.getOrThrow()
    let entry2 = g2.entryBlock
    let t2 = g2.appendBlock()
    let gt2 = GoTo.create(t2)
    entry2.appendExpr(gt2)
    gt2.destroySelf()
    println("destroySelf unlinks: ${!containsPred(t2, entry2) && t2.predecessors.size == 0}")

    // moveAfter 跨 block：后继 predecessors 换到新 owner
    let fn3 = pkg.addFunction(FuncType.get(Array<Type>(), u), "mv", "mv", "pkg.pred.update")
    fn3.initBody()
    let g3 = fn3.body.getOrThrow()
    let a = g3.entryBlock
    let b = g3.appendBlock()
    let t3 = g3.appendBlock()
    let anchor = Constant.create(UnitLiteral.get())
    b.appendExpr(anchor)
    let gt3 = GoTo.create(t3)
    a.appendExpr(gt3)
    gt3.moveAfter(anchor)
    println("moveAfter rehosts: ${!containsPred(t3, a) && containsPred(t3, b) && t3.predecessors.size == 1}")

    // Branch 同目标两次：predecessors 不重复
    let fn4 = pkg.addFunction(FuncType.get(Array<Type>(), u), "dup", "dup", "pkg.pred.update")
    fn4.initBody()
    let g4 = fn4.body.getOrThrow()
    let entry4 = g4.entryBlock
    let same = g4.appendBlock()
    let c4 = Constant.create(BoolLiteral.get(false))
    entry4.appendExpr(c4)
    entry4.appendExpr(Branch.create(c4.result, same, same))
    println("dedup same target: ${containsPred(same, entry4) && same.predecessors.size == 1}")

    // 两前驱指向同一后继；销毁其中一个 terminator 后仍保留另一前驱
    let fn5 = pkg.addFunction(FuncType.get(Array<Type>(), u), "share", "share", "pkg.pred.update")
    fn5.initBody()
    let g5 = fn5.body.getOrThrow()
    let e5a = g5.entryBlock
    let e5b = g5.appendBlock()
    let shared = g5.appendBlock()
    let gt5a = GoTo.create(shared)
    let gt5b = GoTo.create(shared)
    e5a.appendExpr(gt5a)
    e5b.appendExpr(gt5b)
    gt5a.destroySelf()
    println("shared target after one destroy: ${!containsPred(shared, e5a) && containsPred(shared, e5b) && shared.predecessors.size == 1}")
}
