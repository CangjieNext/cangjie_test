/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// refEq：Branch / MultiBranch / GoTo / Raise / 各类 Try* 表达式

/* SCAN
refEq terminators: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let unit = UnitType.get()
    let boolTy = BoolType.get()
    let pkg = Package("pkg.refeq.term", AccessLevel.Public)
    let callee = pkg.addFunction(FuncType.get([i32], i32), "callee", "callee", "pkg.refeq.term")
    callee.initBody()
    callee.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    let methodFn = pkg.addFunction(FuncType.get([i32], unit), "m", "m", "pkg.refeq.term")

    let brFn = pkg.addFunction(FuncType.get([boolTy], unit), "br", "br", "pkg.refeq.term")
    brFn.initBody()
    let brBg = brFn.body.getOrThrow()
    let bt = brBg.appendBlock()
    let bf = brBg.appendBlock()
    let br = Branch.create(brFn.parameters[0], bt, bf)
    brBg.entryBlock.appendExpr(br)
    bt.appendExpr(Exit.create())
    bf.appendExpr(Exit.create())

    let mbFn = pkg.addFunction(FuncType.get([i32], unit), "mb", "mb", "pkg.refeq.term")
    mbFn.initBody()
    let mbBg = mbFn.body.getOrThrow()
    let defB = mbBg.appendBlock()
    let c0 = mbBg.appendBlock()
    let targets = ArrayList<Block>()
    targets.add(c0)
    let cases = ArrayList<UInt64>()
    cases.add(0u64)
    let mb = MultiBranch.create(mbFn.parameters[0], defB, targets, cases)
    mbBg.entryBlock.appendExpr(mb)
    defB.appendExpr(Exit.create())
    c0.appendExpr(Exit.create())

    let raFn = pkg.addFunction(FuncType.get([i32], unit), "ra", "ra", "pkg.refeq.term")
    raFn.initBody()
    let ra2 = RaiseException.create(raFn.parameters[0])
    raFn.body.getOrThrow().entryBlock.appendExpr(ra2)

    let gtFn = pkg.addFunction(FuncType.get(Array<Type>(), unit), "gt", "gt", "pkg.refeq.term")
    gtFn.initBody()
    let gtBg = gtFn.body.getOrThrow()
    let gtTarget = gtBg.appendBlock()
    let gt = GoTo.create(gtTarget)
    gtBg.entryBlock.appendExpr(gt)
    gtTarget.appendExpr(Exit.create())

    let traaFn = pkg.addFunction(FuncType.get([i32], unit), "traa", "traa", "pkg.refeq.term")
    traaFn.initBody()
    let traaBg = traaFn.body.getOrThrow()
    let tn = traaBg.appendBlock()
    let te = traaBg.appendBlock()
    let traa = TryRawArrayAllocate.create(i32, traaFn.parameters[0], tn, te)
    traaBg.entryBlock.appendExpr(traa)
    tn.appendExpr(Exit.create())
    te.appendExpr(Exit.create())

    let tbinFn = pkg.addFunction(FuncType.get([i32], unit), "tbin", "tbin", "pkg.refeq.term")
    tbinFn.initBody()
    let tbinBg = tbinFn.body.getOrThrow()
    let tbn = tbinBg.appendBlock()
    let tbe = tbinBg.appendBlock()
    let tbin = TryBinaryExpression.create(BinaryExprKind.Add, tbinFn.parameters[0], tbinFn.parameters[0], tbn, tbe)
    tbinBg.entryBlock.appendExpr(tbin)
    tbn.appendExpr(Exit.create())
    tbe.appendExpr(Exit.create())

    let tunFn = pkg.addFunction(FuncType.get([i32], unit), "tun", "tun", "pkg.refeq.term")
    tunFn.initBody()
    let tunBg = tunFn.body.getOrThrow()
    let tunN = tunBg.appendBlock()
    let tunE = tunBg.appendBlock()
    let tun = TryUnaryExpression.create(tunFn.parameters[0], tunN, tunE)
    tunBg.entryBlock.appendExpr(tun)
    tunN.appendExpr(Exit.create())
    tunE.appendExpr(Exit.create())

    let tncFn = pkg.addFunction(FuncType.get([i32], unit), "tnc", "tnc", "pkg.refeq.term")
    tncFn.initBody()
    let tncBg = tncFn.body.getOrThrow()
    let tncN = tncBg.appendBlock()
    let tncE = tncBg.appendBlock()
    let tnc = TryNumericCast.create(tncFn.parameters[0], i64, tncN, tncE)
    tncBg.entryBlock.appendExpr(tnc)
    tncN.appendExpr(Exit.create())
    tncE.appendExpr(Exit.create())

    let taFn = pkg.addFunction(FuncType.get([i32], unit), "ta", "ta", "pkg.refeq.term")
    taFn.initBody()
    let taBg = taFn.body.getOrThrow()
    let taN = taBg.appendBlock()
    let taE = taBg.appendBlock()
    let ta = TryApply.create(callee, FuncCallContext([taFn.parameters[0]], Array<Type>(), None), taN, taE)
    taBg.entryBlock.appendExpr(ta)
    taN.appendExpr(Exit.create())
    taE.appendExpr(Exit.create())

    let tallFn = pkg.addFunction(FuncType.get(Array<Type>(), unit), "tall", "tall", "pkg.refeq.term")
    tallFn.initBody()
    let tallBg = tallFn.body.getOrThrow()
    let tallN = tallBg.appendBlock()
    let tallE = tallBg.appendBlock()
    let tall = TryAllocate.create(i32, tallN, tallE)
    tallBg.entryBlock.appendExpr(tall)
    tallN.appendExpr(Exit.create())
    tallE.appendExpr(Exit.create())

    let tiFn = pkg.addFunction(FuncType.get([i32], unit), "ti", "ti", "pkg.refeq.term")
    tiFn.initBody()
    let tiBg = tiFn.body.getOrThrow()
    let tiN = tiBg.appendBlock()
    let tiE = tiBg.appendBlock()
    let gs2 = GetRTTIStatic.create(i32)
    tiBg.entryBlock.appendExpr(gs2)
    let ti = TryInvoke.create(i32, InvokeCallContext(gs2.result, FuncCallContext([tiFn.parameters[0]], Array<Type>(), None), methodFn), tiN, tiE)
    tiBg.entryBlock.appendExpr(ti)
    tiN.appendExpr(Exit.create())
    tiE.appendExpr(Exit.create())

    let ioFn = pkg.addFunction(FuncType.get(Array<Type>(), unit), "iotry", "iotry", "pkg.refeq.term")
    ioFn.initBody()
    let ioBg = ioFn.body.getOrThrow()
    let ioN = ioBg.appendBlock()
    let ioE = ioBg.appendBlock()
    let ioB = CHIRBuilder(ioBg.entryBlock)
    let tryIo = ioB.createTryInout(RefType.get(i32), ioB.createAllocate(i32).result, ioN, ioE)
    ioN.appendExpr(Exit.create())
    ioE.appendExpr(Exit.create())

    let ok = br == br && mb == mb && ra2 == ra2 && gt == gt && traa == traa &&
        tbin == tbin && tun == tun && tnc == tnc && ta == ta && tall == tall &&
        ti == ti && tryIo == tryIo
    println("refEq terminators: ${ok}")
}
