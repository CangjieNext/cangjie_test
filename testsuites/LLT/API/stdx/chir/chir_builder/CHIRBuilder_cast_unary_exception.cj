/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
cast and get: true true true true true true
raise unary: true true true true true
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
    let v = b.createConstant(IntLiteral.get(i32, 9u64)).result

    let bx = b.createBox(v, RefType.get(i32))
    let ubRef = b.createUnboxToRef(v, RefType.get(i32))
    let ubVal = b.createUnboxToValue(v, i32)
    let sc = b.createStaticCast(v, i32)
    let io = b.createInstanceOf(v, i32)
    let nc = b.createNumericCast(v, IntType.getInt64(), OverflowStrategy.Wrapping)
    let tnc = b.createTryNumericCast(v, IntType.getInt64(), bn, be)
    println("cast and get: ${bx.targetType == RefType.get(i32)} ${ubRef.targetType == RefType.get(i32)} ${ubVal.targetType == i32} ${sc.srcValue == v} ${io.targetType == i32} ${tnc.errorBranch == be && nc.overflow == OverflowStrategy.Wrapping}")

    let ge = b.createGetException(i32)
    let gr = b.createGetRTTI(v)
    let gs = b.createGetRTTIStatic(i32)
    let ra = b.createRaiseException(v)
    let rb = b.createRaiseException(v, bn)
    let ub = b.createUnaryBitNot(v)
    let un = b.createUnaryNeg(v, OverflowStrategy.Wrapping)
    let tun = b.createTryUnaryNeg(v, bn, be)
    let uno = b.createUnaryNot(v)
    let unaryOK = ub.toString().contains("BitNot") && un.toString().contains("Neg") && tun.errorBranch == be && uno.toString().contains("Not")
    println("raise unary: ${ge.result.ty == i32} ${gr.result.ty == UnitType.get()} ${gs.ty == i32} ${ra.operands.size == 1 && rb.operands.size == 2} ${unaryOK}")
}
