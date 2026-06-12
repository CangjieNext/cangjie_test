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

// Allocate, Load, Store

main() {
    let pkg = Package("pkg.ser4", AccessLevel.Public)
    let i64 = IntType.getInt64()

    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn1", "fn1", "pkg.ser4")
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock

    let alloc = Allocate.create(i64)
    bb.appendExpr(alloc)

    let initVal = Constant.create(IntLiteral.get(i64, 42u64))
    bb.appendExpr(initVal)
    let st = Store.create(initVal.result, alloc.result)
    bb.appendExpr(st)

    let ld = Load.create(alloc.result)
    bb.appendExpr(ld)

    // store loaded value back
    let st2 = Store.create(ld.result, alloc.result)
    bb.appendExpr(st2)

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
