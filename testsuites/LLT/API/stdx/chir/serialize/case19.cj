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

// StoreElementRef, StoreElementByName

main() {
    let pkg = Package("pkg.ser19", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    // fn1: Allocate tuple-like, StoreElementRef
    let fn1 = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fn1", "fn1", "pkg.ser19")
    fn1.initBody()
    let bb1 = fn1.body.getOrThrow().entryBlock
    let p1 = fn1.parameters[0]

    let alloc = Allocate.create(i32)
    bb1.appendExpr(alloc)

    let path = ArrayList<UInt64>()
    path.add(0u64)
    let ser = StoreElementRef.create(p1, alloc.result, path)
    bb1.appendExpr(ser)

    let names = ArrayList<String>()
    names.add("field0")
    let sebn = StoreElementByName.create(p1, alloc.result, names)
    bb1.appendExpr(sebn)

    bb1.appendExpr(Exit.create())

    // fn2: multiple functions with different param types
    let fn2 = pkg.addFunction(FuncType.get([i64], UnitType.get()), "fn2", "fn2", "pkg.ser19")
    fn2.initBody()
    let bb2 = fn2.body.getOrThrow().entryBlock
    let p2 = fn2.parameters[0]

    let alloc2 = Allocate.create(i64)
    bb2.appendExpr(alloc2)

    let path2 = ArrayList<UInt64>()
    path2.add(0u64)
    let ser2 = StoreElementRef.create(p2, alloc2.result, path2)
    bb2.appendExpr(ser2)

    let names2 = ArrayList<String>()
    names2.add("val")
    let sebn2 = StoreElementByName.create(p2, alloc2.result, names2)
    bb2.appendExpr(sebn2)

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
