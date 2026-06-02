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

// RawArrayAllocate, RawArrayLiteralInit, RawArrayInitByValue

main() {
    let pkg = Package("pkg.ser11", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn1", "fn1", "pkg.ser11")
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock

    let sz = Constant.create(IntLiteral.get(i32, 4u64))
    bb.appendExpr(sz)

    let ra = RawArrayAllocate.create(i32, sz.result)
    bb.appendExpr(ra)

    let initVal = Constant.create(IntLiteral.get(i32, 0u64))
    bb.appendExpr(initVal)
    let riv = RawArrayInitByValue.create(ra.result, sz.result, initVal.result)
    bb.appendExpr(riv)

    // fn2: RawArrayLiteralInit
    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn2", "fn2", "pkg.ser11")
    fn2.initBody()
    let bb2 = fn2.body.getOrThrow().entryBlock

    let sz2 = Constant.create(IntLiteral.get(i32, 3u64))
    bb2.appendExpr(sz2)
    let ra2 = RawArrayAllocate.create(i32, sz2.result)
    bb2.appendExpr(ra2)

    let v0 = Constant.create(IntLiteral.get(i32, 10u64))
    let v1 = Constant.create(IntLiteral.get(i32, 20u64))
    let v2 = Constant.create(IntLiteral.get(i32, 30u64))
    bb2.appendExpr(v0)
    bb2.appendExpr(v1)
    bb2.appendExpr(v2)
    let els = ArrayList<Value>()
    els.add(v0.result)
    els.add(v1.result)
    els.add(v2.result)
    bb2.appendExpr(RawArrayLiteralInit.create(ra2.result, els))

    bb.appendExpr(Exit.create())
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
