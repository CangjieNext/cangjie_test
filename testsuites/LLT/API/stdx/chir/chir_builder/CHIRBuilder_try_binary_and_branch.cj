/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
binary cmp: true true true true true true
try binary: true true true true true true true
branch goto mb: true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.call", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "f", "f", "pkg.cb.call")
    fn.initBody()
    let body = fn.body.getOrThrow()
    let bb = body.entryBlock
    let bn = body.appendBlock()
    let be = body.appendBlock()
    let b = CHIRBuilder(bb)
    let v1 = b.createConstant(IntLiteral.get(i32, 7u64)).result
    let v2 = b.createConstant(IntLiteral.get(i32, 3u64)).result

    let gt = b.createBinaryGreaterThan(v1, v2)
    let ge = b.createBinaryGreaterThanOrEqual(v1, v2)
    let ls = b.createBinaryLShift(v1, v2, OverflowStrategy.Wrapping)
    let lt = b.createBinaryLessThan(v1, v2)
    let le = b.createBinaryLessThanOrEqual(v1, v2)
    let rs = b.createBinaryRShift(v1, v2, OverflowStrategy.Wrapping)
    let cmpOK = gt.toString().contains("GT") && ge.toString().contains("GE") && ls.toString().contains("LShift") &&
        lt.toString().contains("LT") && le.toString().contains("LE") && rs.toString().contains("RShift")
    println("binary cmp: ${cmpOK} ${gt.result.ty == BoolType.get()} ${ge.result.ty == BoolType.get()} ${lt.result.ty == BoolType.get()} ${le.result.ty == BoolType.get()} ${ls.overflow == OverflowStrategy.Wrapping}")

    let ta = b.createTryBinaryAdd(v1, v2, bn, be)
    let td = b.createTryBinaryDiv(v1, v2, OverflowStrategy.Wrapping, bn, be)
    let te = b.createTryBinaryExp(v1, v2, bn, be)
    let tl = b.createTryBinaryLShift(v1, v2, bn, be)
    let tm = b.createTryBinaryMod(v1, v2, bn, be)
    let tmu = b.createTryBinaryMul(v1, v2, bn, be)
    let ts = b.createTryBinarySub(v1, v2, bn, be)
    let tryOK = te.toString().contains("Exp") && tl.toString().contains("LShift") && tm.toString().contains("Mod") &&
        tmu.toString().contains("Mul") && ts.toString().contains("Sub")
    println("try binary: ${ta.normalBranch == bn} ${td.errorBranch == be} ${tryOK} ${td.overflow == OverflowStrategy.Wrapping} ${tl.normalBranch == bn} ${tm.errorBranch == be} ${ts.normalBranch == bn}")

    let br = b.createBranch(v1, bn, be)
    let gt2 = b.createGoTo(bn)
    let mb = b.createMultiBranch(v1, be, ArrayList<Block>.of([bn]), ArrayList<UInt64>.of([1u64]))
    println("branch goto mb: ${br.trueTarget == bn} ${gt2.isTerminator()} ${mb.caseValues[0] == 1u64}")
}
