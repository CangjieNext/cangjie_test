/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import std.collection.*
import stdx.chir.*

// TrySpawn with extra arg + executeClosure (operands.size > 3 arm)

main() {
    let pkgName = "pkg.ser57"
    let pkg = Package(pkgName, AccessLevel.Public)
    let unit = UnitType.get()
    let i32 = IntType.getInt32()

    let closure = pkg.addFunction(FuncType.get(Array<Type>(), unit), "closure", "closure", pkgName)
    closure.initBody()
    closure.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    let fn = pkg.addFunction(FuncType.get(Array<Type>(), unit), "fn", "fn", pkgName)
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock

    let lam = Lambda.create(FuncType.get([i32], unit), "Lam57", "Lam57", ArrayList<GenericType>())
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    let lamAlloc = Allocate.create(unit)
    lam.body.entryBlock.appendExpr(lamAlloc)
    lam.returnValue = lamAlloc.result
    lam.body.entryBlock.appendExpr(Exit.create())

    let arg = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(arg)

    let nbb = bg.appendBlock()
    let ebb = bg.appendBlock()
    let ts = TrySpawn.create(unit, lam.result, arg.result, nbb, ebb)
    ts.executeClosure = closure
    bb.appendExpr(ts)
    nbb.appendExpr(Exit.create())
    ebb.appendExpr(Exit.create())

    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    unsafe { freeSerializedMemory() }
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
