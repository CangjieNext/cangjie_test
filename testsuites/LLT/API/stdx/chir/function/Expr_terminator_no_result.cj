/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// GoTo / Branch / MultiBranch / Exit / RaiseException 作为 terminator 时不产生返回值

/* SCAN
goto no result: true
branch no result: true
multibranch no result: true
exit no result: true
raise no result: true
raise with succ no result: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let unit = UnitType.get()
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.term_no_res", AccessLevel.Public)

    // GoTo
    let fnGoto = pkg.addFunction(FuncType.get(Array<Type>(), unit), "goto", "goto", "pkg.term_no_res")
    fnGoto.initBody()
    let bgGoto = fnGoto.body.getOrThrow()
    let goto = GoTo.create(bgGoto.appendBlock())
    bgGoto.entryBlock.appendExpr(goto)
    println("goto no result: ${goto.isTerminator() && goto.tryGetResult().isNone()}")

    // Branch
    let fnBr = pkg.addFunction(FuncType.get([BoolType.get()], unit), "br", "br", "pkg.term_no_res")
    fnBr.initBody()
    let bgBr = fnBr.body.getOrThrow()
    let trueB = bgBr.appendBlock()
    let falseB = bgBr.appendBlock()
    let br = Branch.create(fnBr.parameters[0], trueB, falseB)
    bgBr.entryBlock.appendExpr(br)
    trueB.appendExpr(Exit.create())
    falseB.appendExpr(Exit.create())
    println("branch no result: ${br.isTerminator() && br.tryGetResult().isNone()}")

    // MultiBranch
    let fnMb = pkg.addFunction(FuncType.get([i32], unit), "mb", "mb", "pkg.term_no_res")
    fnMb.initBody()
    let bgMb = fnMb.body.getOrThrow()
    let defB = bgMb.appendBlock()
    let caseB = bgMb.appendBlock()
    let targets = ArrayList<Block>()
    targets.add(caseB)
    let cases = ArrayList<UInt64>()
    cases.add(0u64)
    let mb = MultiBranch.create(fnMb.parameters[0], defB, targets, cases)
    bgMb.entryBlock.appendExpr(mb)
    defB.appendExpr(Exit.create())
    caseB.appendExpr(Exit.create())
    println("multibranch no result: ${mb.isTerminator() && mb.tryGetResult().isNone()}")

    // Exit
    let fnExit = pkg.addFunction(FuncType.get(Array<Type>(), unit), "ex", "ex", "pkg.term_no_res")
    fnExit.initBody()
    let exit = Exit.create()
    fnExit.body.getOrThrow().entryBlock.appendExpr(exit)
    println("exit no result: ${exit.isTerminator() && exit.tryGetResult().isNone()}")

    // RaiseException (no successor)
    let fnRaise = pkg.addFunction(FuncType.get(Array<Type>(), unit), "rz", "rz", "pkg.term_no_res")
    fnRaise.initBody()
    let bbRaise = fnRaise.body.getOrThrow().entryBlock
    let exVal = Constant.create(IntLiteral.get(i32, 1u64))
    bbRaise.appendExpr(exVal)
    let raise = RaiseException.create(exVal.result)
    bbRaise.appendExpr(raise)
    println("raise no result: ${raise.isTerminator() && raise.tryGetResult().isNone()}")

    // RaiseException (with successor)
    let fnRaise2 = pkg.addFunction(FuncType.get(Array<Type>(), unit), "rz2", "rz2", "pkg.term_no_res")
    fnRaise2.initBody()
    let bgRaise2 = fnRaise2.body.getOrThrow()
    let succ = bgRaise2.appendBlock()
    let exVal2 = Constant.create(IntLiteral.get(i32, 2u64))
    bgRaise2.entryBlock.appendExpr(exVal2)
    let raise2 = RaiseException.create(exVal2.result, succ)
    bgRaise2.entryBlock.appendExpr(raise2)
    succ.appendExpr(Exit.create())
    println("raise with succ no result: ${raise2.isTerminator() && raise2.tryGetResult().isNone()}")
}
