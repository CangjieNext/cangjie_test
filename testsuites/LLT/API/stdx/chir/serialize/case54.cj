/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import stdx.chir.*

// Invoke overflowStrategy serialize roundtrip

main() {
    let pkg = Package("pkg.ser49", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn1", "fn1", "pkg.ser49")
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock

    let gs = GetRTTIStatic.create(i32)
    bb.appendExpr(gs)

    let mty = FuncType.get([i32], UnitType.get())
    let methodFn = pkg.addFunction(mty, "add", "add", "pkg.ser49")
    let arg = Constant.create(IntLiteral.get(i32, 7u64))
    bb.appendExpr(arg)
    let ic = InvokeCallContext(gs.result, FuncCallContext([arg.result], Array<Type>(), None), methodFn,
        overflowStrategy: OverflowStrategy.Wrapping)

    let inv = Invoke.create(UnitType.get(), ic)
    bb.appendExpr(inv)

    let bg = fn1.body.getOrThrow()
    let normalBb = bg.appendBlock()
    let errorBb = bg.appendBlock()
    let icSat = InvokeCallContext(gs.result, FuncCallContext([arg.result], Array<Type>(), None), methodFn,
        overflowStrategy: OverflowStrategy.Saturating)
    let ti = TryInvoke.create(i32, icSat, normalBb, errorBb)
    bb.appendExpr(ti)
    normalBb.appendExpr(Exit.create())
    errorBb.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
