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

// InstanceOf, GetRTTI, GetRTTIStatic, GetException, GetInstantiateValue

main() {
    let pkg = Package("pkg.ser14", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    let fn1 = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fn1", "fn1", "pkg.ser14")
    fn1.initBody()
    let bb = fn1.body.getOrThrow().entryBlock
    let p = fn1.parameters[0]

    let iof = InstanceOf.create(p, i64)
    bb.appendExpr(iof)

    let gr = GetRTTI.create(p)
    bb.appendExpr(gr)

    let gs = GetRTTIStatic.create(i32)
    bb.appendExpr(gs)

    let ge = GetException.create(i32)
    bb.appendExpr(ge)

    // fn2 for GetInstantiateValue
    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), i32), "fn2", "fn2", "pkg.ser14")
    let giv = GetInstantiateValue.create(fn2, ArrayList<Type>.of([i32, i64]))
    bb.appendExpr(giv)

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
