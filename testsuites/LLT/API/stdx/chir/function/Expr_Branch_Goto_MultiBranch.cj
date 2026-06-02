/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Branch、GoTo、MultiBranch

/* SCAN
branch succ: 2
branch tf: true
goto term: true
multibranch cases: 2
mb def targets: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let u = UnitType.get()
    let t = Constant.create(BoolLiteral.get(true)).result
    let i0 = Constant.create(IntLiteral.get(IntType.getInt32(), 0u64)).result

    let pkg = Package("pkg.bgm", AccessLevel.Public)
    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), u), "b1", "b1", "pkg.bgm")
    fn1.initBody()
    let g1 = fn1.body.getOrThrow()
    let tb = g1.appendBlock()
    let fb = g1.appendBlock()
    let br = Branch.create(t, tb, fb)
    g1.entryBlock.appendExpr(br)
    println("branch succ: ${br.successors.size}")
    println("branch tf: ${br.trueTarget == tb && br.falseTarget == fb}")

    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), u), "g1", "g1", "pkg.bgm")
    fn2.initBody()
    let g2 = fn2.body.getOrThrow()
    let gt = GoTo.create(g2.appendBlock())
    g2.entryBlock.appendExpr(gt)
    println("goto term: ${gt.isTerminator()}")

    let fn3 = pkg.addFunction(FuncType.get(Array<Type>(), u), "m1", "m1", "pkg.bgm")
    fn3.initBody()
    let g3 = fn3.body.getOrThrow()
    let defb = g3.appendBlock()
    let targets = ArrayList<Block>()
    targets.add(g3.appendBlock())
    targets.add(g3.appendBlock())
    let cases = ArrayList<UInt64>()
    cases.add(0u64)
    cases.add(1u64)
    let mb = MultiBranch.create(i0, defb, targets, cases)
    g3.entryBlock.appendExpr(mb)
    println("multibranch cases: ${mb.caseValues.size}")
    println("mb def targets: ${mb.defaultTarget == defb && mb.targetsWithoutDefault.size == 2 && mb.condition == i0}")
}
