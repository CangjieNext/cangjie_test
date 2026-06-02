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

// Apply, TryApply
// fn1 带泛型参数 T, U, V（3个）；fn2 带泛型参数 W, X, Y, Z, P, Q（6个）

main() {
    let pkg = Package("pkg.ser15", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let gT = GenericType.get("pkg.ser15.T", "T")
    let gU = GenericType.get("pkg.ser15.U", "U")
    let gV = GenericType.get("pkg.ser15.V", "V")
    let gW = GenericType.get("pkg.ser15.W", "W")
    let gX = GenericType.get("pkg.ser15.X", "X")
    let gY = GenericType.get("pkg.ser15.Y", "Y")
    let gZ = GenericType.get("pkg.ser15.Z", "Z")
    let gP = GenericType.get("pkg.ser15.P", "P")
    let gQ = GenericType.get("pkg.ser15.Q", "Q")

    // callee: (Int32) -> Int32
    let callee = pkg.addFunction(FuncType.get([i32], i32), "callee", "callee", "pkg.ser15")
    callee.initBody()
    callee.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    // fn1: Apply(callee, param), 带泛型参数 T, U, V
    let fn1 = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fn1", "fn1", "pkg.ser15")
    fn1.genericTypeParams = [gT, gU, gV]
    fn1.initBody()
    let bb1 = fn1.body.getOrThrow().entryBlock
    let p1 = fn1.parameters[0]
    let fcc = FuncCallContext([p1], Array<Type>(), None)
    let ap = Apply.create(callee, fcc)
    bb1.appendExpr(ap)
    bb1.appendExpr(Exit.create())

    // fn2: TryApply(callee, param, normalBlock, errorBlock), 带泛型参数 W, X, Y, Z, P, Q
    let fn2 = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fn2", "fn2", "pkg.ser15")
    fn2.genericTypeParams = [gW, gX, gY, gZ, gP, gQ]
    fn2.initBody()
    let bg2 = fn2.body.getOrThrow()
    let entry2 = bg2.entryBlock
    let p2 = fn2.parameters[0]
    let normalBb = bg2.appendBlock()
    let errorBb = bg2.appendBlock()
    let fcc2 = FuncCallContext([p2], Array<Type>(), None)
    let ta = TryApply.create(callee, fcc2, normalBb, errorBb)
    entry2.appendExpr(ta)
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
