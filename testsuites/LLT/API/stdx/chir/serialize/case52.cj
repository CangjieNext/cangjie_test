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

// freeSerializedMemory, null-root deserialize, lambda round-trip

main() {
    var nullThrows = false
    try {
        deserializePackage(CPointer<UInt8>(), 0)
    } catch (_: CHIRException) {
        nullThrows = true
    }
    if (!nullThrows) {
        return 1
    }

    let pkgName = "pkg.ser52"
    let pkg = Package(pkgName, AccessLevel.Public)
    let i32 = IntType.getInt32()

    let fn = pkg.addFunction(FuncType.get([i32], i32), "fn", "fn", pkgName)
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock

    let lam = Lambda.create(FuncType.get([i32], i32), "Lam52", "Lam52", ArrayList<GenericType>())
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    let lamAlloc = Allocate.create(i32)
    lam.body.entryBlock.appendExpr(lamAlloc)
    lam.returnValue = lamAlloc.result
    lam.body.entryBlock.appendExpr(Exit.create())
    bb.appendExpr(Exit.create())

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    unsafe { freeSerializedMemory() }
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
