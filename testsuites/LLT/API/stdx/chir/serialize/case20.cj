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

// VArrayExpr, VArrayBuilder, Debug, Constant (multiple functions)

main() {
    let pkg = Package("pkg.ser20", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let vaTy = VArrayType.get(i32, 3i64)

    // fn1: VArrayExpr from 3 i32 params
    let fn1 = pkg.addFunction(FuncType.get([i32, i32, i32], vaTy), "fn1", "fn1", "pkg.ser20")
    fn1.initBody()
    let bb1 = fn1.body.getOrThrow().entryBlock
    let els = ArrayList<Value>()
    els.add(fn1.parameters[0])
    els.add(fn1.parameters[1])
    els.add(fn1.parameters[2])
    let vae = VArrayExpr.create(els)
    bb1.appendExpr(vae)
    bb1.appendExpr(Exit.create())

    // fn2: VArrayBuilder + Debug + Constant
    let initFn = pkg.addFunction(FuncType.get([i32], i32), "initFn", "initFn", "pkg.ser20")
    initFn.initBody()
    initFn.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn2", "fn2", "pkg.ser20")
    fn2.initBody()
    let bb2 = fn2.body.getOrThrow().entryBlock

    let c1 = Constant.create(IntLiteral.get(i32, 3u64))
    bb2.appendExpr(c1)

    let c2 = Constant.create(IntLiteral.get(i32, 0u64))
    bb2.appendExpr(c2)

    let dbg = Debug.create(c1.result, "case20.cj")
    bb2.appendExpr(dbg)

    let vb = VArrayBuilder.create(vaTy, c1.result, c2.result, initFn)
    bb2.appendExpr(vb)

    bb2.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
