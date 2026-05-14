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

// TryAllocate, TryRawArrayAllocate, TryNumericCast

main() {
    let pkg = Package("pkg.ser10", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    let fn1 = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "fn1", "fn1", "pkg.ser10")
    fn1.initBody()
    let bg = fn1.body.getOrThrow()
    let entry = bg.entryBlock

    let szConst = Constant.create(IntLiteral.get(i32, 4u64))
    entry.appendExpr(szConst)

    // TryAllocate: terminator
    let n0 = bg.appendBlock()
    let e0 = bg.appendBlock()
    entry.appendExpr(TryAllocate.create(i64, n0, e0))
    e0.appendExpr(Exit.create())

    // TryRawArrayAllocate: terminator
    let n1 = bg.appendBlock()
    let e1 = bg.appendBlock()
    n0.appendExpr(TryRawArrayAllocate.create(i32, szConst.result, n1, e1))
    e1.appendExpr(Exit.create())

    // TryNumericCast: terminator
    let n2 = bg.appendBlock()
    let e2 = bg.appendBlock()
    let castSrc = Constant.create(IntLiteral.get(i32, 100u64))
    n1.appendExpr(castSrc)
    n1.appendExpr(TryNumericCast.create(castSrc.result, i64, n2, e2))
    e2.appendExpr(Exit.create())
    n2.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
