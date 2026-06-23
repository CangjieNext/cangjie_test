/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// InvokeBase.callee、InvokeCallContext.method/overflowStrategy、methodName 前缀、getArgs

/* SCAN
callee method: true true
ctx method: true
mgp type: true
inst getArgs: 2
static getArgs: 1
try getArgs: 1 2
overflow: &add ~add %add add
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.inv.api", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "host", "host", "pkg.inv.api")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let arg = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(arg)
    let v = arg.result

    let mty = FuncType.get([i32], UnitType.get())

    let instMethod = pkg.addFunction(mty, "instM", "instM", "pkg.inv.api")
    let gT = GenericType.get("pkg.inv.api.T", "T")
    instMethod.genericTypeParams = [gT]
    let icInst = InvokeCallContext(v, FuncCallContext([v], Array<Type>(), None), instMethod)
    let invInst = Invoke.create(UnitType.get(), icInst)
    bb.appendExpr(invInst)

    let staticMethod = pkg.addFunction(mty, "staticM", "staticM", "pkg.inv.api")
    staticMethod.setStatic(true)
    let gs = GetRTTIStatic.create(i32)
    bb.appendExpr(gs)
    let icStatic = InvokeCallContext(gs.result, FuncCallContext([v], Array<Type>(), None), staticMethod)
    let invStatic = Invoke.create(UnitType.get(), icStatic)
    bb.appendExpr(invStatic)

    println("callee method: ${invInst.callee == instMethod && invStatic.callee == staticMethod} ${invInst.methodType == mty}")
    println("ctx method: ${icInst.method == instMethod && icStatic.method == staticMethod}")
    println("mgp type: ${invInst.methodGenericTypeParams.size == 1}")
    println("inst getArgs: ${invInst.getArgs().size}")
    println("static getArgs: ${invStatic.getArgs().size}")

    let bn = fn.body.getOrThrow().appendBlock()
    let be = fn.body.getOrThrow().appendBlock()
    let tiStatic = TryInvoke.create(i32, icStatic, bn, be)
    let tiInst = TryInvoke.create(i32, icInst, bn, be)
    println("try getArgs: ${tiStatic.getArgs().size} ${tiInst.getArgs().size}")

    let opMethod = pkg.addFunction(mty, "add", "add", "pkg.inv.api")
    let icWrap = InvokeCallContext(gs.result, FuncCallContext([v], Array<Type>(), None), opMethod,
        overflowStrategy: OverflowStrategy.Wrapping)
    let icThrow = InvokeCallContext(gs.result, FuncCallContext([v], Array<Type>(), None), opMethod,
        overflowStrategy: OverflowStrategy.Throwing)
    let icSat = InvokeCallContext(gs.result, FuncCallContext([v], Array<Type>(), None), opMethod,
        overflowStrategy: OverflowStrategy.Saturating)
    let icNa = InvokeCallContext(gs.result, FuncCallContext([v], Array<Type>(), None), opMethod)
    let invWrap = Invoke.create(UnitType.get(), icWrap)
    let invThrow = Invoke.create(UnitType.get(), icThrow)
    let invSat = Invoke.create(UnitType.get(), icSat)
    let invNa = Invoke.create(UnitType.get(), icNa)
    println("overflow: ${invWrap.methodName} ${invThrow.methodName} ${invSat.methodName} ${invNa.methodName}")
}
