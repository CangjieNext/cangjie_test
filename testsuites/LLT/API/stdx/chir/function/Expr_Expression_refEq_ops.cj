/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// refEq：Cast / RawArray / VArray / Binary / Unary / Apply / Invoke / Spawn

/* SCAN
refEq ops: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let unit = UnitType.get()
    let pkg = Package("pkg.refeq.ops", AccessLevel.Public)
    let callee = pkg.addFunction(FuncType.get([i32], i32), "callee", "callee", "pkg.refeq.ops")
    callee.initBody()
    callee.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    let methodFn = pkg.addFunction(FuncType.get([i32], unit), "m", "m", "pkg.refeq.ops")
    let initFn = pkg.addFunction(FuncType.get([i32], i32), "initFn", "initFn", "pkg.refeq.ops")
    initFn.initBody()
    initFn.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    let fn = pkg.addFunction(FuncType.get([i32], unit), "host", "host", "pkg.refeq.ops")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let c = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(c)
    let v = c.result

    let nc = NumericCast.create(v, i64, OverflowStrategy.NA)
    nc.overflow = OverflowStrategy.Wrapping
    bb.appendExpr(nc)
    let sc = StaticCast.create(v, i64)
    bb.appendExpr(sc)
    let ubr = UnboxToRef.create(v, RefType.get(i32))
    bb.appendExpr(ubr)
    let ubv = UnboxToValue.create(v, i32)
    bb.appendExpr(ubv)
    let raa = RawArrayAllocate.create(i32, v)
    bb.appendExpr(raa)
    let rai = RawArrayInitByValue.create(raa.result, v, v)
    bb.appendExpr(rai)
    let ral = RawArrayLiteralInit.create(raa.result, ArrayList<Value>.of([v]))
    bb.appendExpr(ral)
    let vae = VArrayExpr.create(ArrayList<Value>.of([v, v, v]))
    bb.appendExpr(vae)
    let sz = Constant.create(IntLiteral.get(i32, 3u64))
    bb.appendExpr(sz)
    let vabuilder = VArrayBuilder.create(VArrayType.get(i32, 3i64), sz.result, v, initFn)
    bb.appendExpr(vabuilder)
    let bin = BinaryExpression.create(BinaryExprKind.Add, v, v)
    bb.appendExpr(bin)
    let un = UnaryExpression.create(UnaryExprKind.Neg, v)
    bb.appendExpr(un)
    let _ = un.overflow
    let ap = Apply.create(callee, FuncCallContext([v], Array<Type>(), None))
    bb.appendExpr(ap)
    let lam = Lambda.create(FuncType.get([i32], i32), "Lam", "Lam", ArrayList<GenericType>())
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    lam.body.entryBlock.appendExpr(Exit.create())
    let sp = Spawn.create(unit, lam.result)
    bb.appendExpr(sp)
    let gs = GetRTTIStatic.create(i32)
    bb.appendExpr(gs)
    let inv = Invoke.create(unit, InvokeCallContext(gs.result, FuncCallContext([v], Array<Type>(), None), methodFn))
    bb.appendExpr(inv)
    let sAlloc = Allocate.create(IntType.getInt32())
    bb.appendExpr(sAlloc)
    let io = CHIRBuilder(bb).createInout(RefType.get(i32), sAlloc.result)

    let ok = nc == nc && sc == sc && ubr == ubr && ubv == ubv && raa == raa && rai == rai &&
        ral == ral && vae == vae && vabuilder == vabuilder && bin == bin && un == un &&
        ap == ap && lam == lam && sp == sp && inv == inv && io == io
    println("refEq ops: ${ok}")
    bb.appendExpr(Exit.create())
}
