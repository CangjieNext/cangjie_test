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
import stdx.chir.Box as BoxExpr

// Box, StaticCast, UnboxToRef, UnboxToValue, NumericCast

main() {
    let pkg = Package("pkg.ser13", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    let fn1 = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fn1", "fn1", "pkg.ser13")
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock
    let p = fn1.parameters[0]

    // NumericCast: i32 -> i64
    let nc = NumericCast.create(p, i64, OverflowStrategy.Wrapping)
    bb.appendExpr(nc)

    // StaticCast: i32 -> i64
    let sc = StaticCast.create(p, i64)
    bb.appendExpr(sc)

    // Box: i32 -> Ref<i32>
    let bx = BoxExpr.create(p, RefType.get(i32))
    bb.appendExpr(bx)

    // UnboxToRef: i32 -> Ref<i32>
    let ur = UnboxToRef.create(p, RefType.get(i32))
    bb.appendExpr(ur)

    // UnboxToValue: i32 -> i32
    let uv = UnboxToValue.create(p, i32)
    bb.appendExpr(uv)

    bb.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
