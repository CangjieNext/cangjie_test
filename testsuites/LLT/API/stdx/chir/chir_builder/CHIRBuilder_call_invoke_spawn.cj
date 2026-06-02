/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
apply invoke: true true true true
spawn: true true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.call", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(1, { _ => i32 }), i32), "f", "f", "pkg.cb.call")
    let callee = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "c", "c", "pkg.cb.call")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock  
    let b = CHIRBuilder(bb)
    let lam = b.createLambda(FuncType.get(Array<Type>(), UnitType.get()), "b3", "b3")
    let body = lam.body
    let bn = body.appendBlock()
    let be = body.appendBlock()
    let arg = b.createConstant(IntLiteral.get(i32, 1u64)).result

    let fcc = FuncCallContext([arg], Array<Type>(), None)
    let ap = b.createApply(fn, fcc)
    let tap = b.createTryApply(fn, fcc, bn, be)
    let rtti = b.createGetRTTIStatic(i32)
    let mty = FuncType.get(Array<Type>(1, { _ => i32 }), UnitType.get())
    let ic = InvokeCallContext(rtti.result, FuncSigInfo("foo", mty, Array<GenericType>()), fcc)
    let inv = b.createInvoke(UnitType.get(), ic)
    let tinv = b.createTryInvoke(i32, ic, bn, be)
    println("apply invoke: ${ap.callee == fn} ${tap.errorBranch == be} ${inv.methodName == "foo"} ${tinv.normalBranch == bn}")

    let lv = b.createLambda(FuncType.get(Array<Type>(1, { _ => i32 }), UnitType.get()), "L0", "L0").result
    let sp1 = b.createSpawn(UnitType.get(), lv)
    let sp2 = b.createSpawn(UnitType.get(), lv, arg)
    let ts1 = b.createTrySpawn(UnitType.get(), lv, bn, be)
    let ts2 = b.createTrySpawn(UnitType.get(), lv, arg, bn, be)
    sp1.executeClosure = callee
    println("spawn: ${sp1.operands.size == 1} ${sp2.operands.size == 2} ${ts1.errorBranch == be} ${ts2.needExecuteClosure() == false}")
}
