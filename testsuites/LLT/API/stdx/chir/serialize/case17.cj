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

// Spawn, TrySpawn, Lambda

main() {
    let pkg = Package("pkg.ser17", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn1", "fn1", "pkg.ser17")
    fn1.initBody()
    let bg = fn1.body.getOrThrow()
    let bb = bg.entryBlock

    // Lambda with no params
    let lam = Lambda.create(FuncType.get(Array<Type>(), UnitType.get()), "Lam1", "Lam1", ArrayList<GenericType>())
    bb.appendExpr(lam)
    lam.initBody()
    let lamAlloc = Allocate.create(UnitType.get())
    lam.body.entryBlock.appendExpr(lamAlloc)
    lam.returnValue = lamAlloc.result
    lam.body.entryBlock.appendExpr(Exit.create())

    // Spawn(lambda)
    let sp1 = Spawn.create(UnitType.get(), lam.result)
    bb.appendExpr(sp1)

    // Lambda with one param
    let lam2 = Lambda.create(FuncType.get([i32], UnitType.get()), "Lam2", "Lam2", ArrayList<GenericType>())
    bb.appendExpr(lam2)
    lam2.initBody()
    let lam2Alloc = Allocate.create(UnitType.get())
    lam2.body.entryBlock.appendExpr(lam2Alloc)
    lam2.returnValue = lam2Alloc.result
    lam2.body.entryBlock.appendExpr(Exit.create())
    let arg = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(arg)

    // Spawn(lambda, arg)
    let sp2 = Spawn.create(UnitType.get(), lam2.result, arg.result)
    bb.appendExpr(sp2)

    // TrySpawn: terminator
    let normalBb = bg.appendBlock()
    let errorBb = bg.appendBlock()
    let ts = TrySpawn.create(UnitType.get(), lam.result, normalBb, errorBb)
    bb.appendExpr(ts)
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
